#include <FTDebouncer.h>

#include "Keyboard.h"

const int buttonPin = 4;          // input pin for pushbutton
int previousButtonState = HIGH;   // for checking the state of a pushButton
int counter = 0;                  // button push counter

FTDebouncer pinDebouncer;

#define FIRST_BUTTON_PIN 3
#define LAST_BUTTON_PIN 7

void setup() {
  // make the pushButton pin an input:
  pinMode(buttonPin, INPUT);
  // initialize control over the keyboard:
  Keyboard.begin();
  for(uint8_t buttonPin = FIRST_BUTTON_PIN; buttonPin <= LAST_BUTTON_PIN; buttonPin++){
    pinDebouncer.addPin(buttonPin, LOW);
  }
  pinDebouncer.init();
}

void loop() {
  pinDebouncer.run();
}

void pinActivated(uint8_t pinNR){
  // do something according to the _pinNR that is triggered
  // for instance:
  
  switch(pinNR){
    case 3:
    Keyboard.press('a');
    break;
    case 4:
    Keyboard.press('s');
    break;
    case 5:
    Keyboard.press('d');
    break;
    case 6:
    Keyboard.press('f');
    break;
    case 7:
    Keyboard.press('g');
    break;
    default:
    break;
  }
}
void pinDeactivated(uint8_t pinNR){
  // do something according to the _pinNR that is triggered
  // for instance:
  switch(pinNR){
    case 3:
    Keyboard.release('a');
    break;
    case 4:
    Keyboard.release('s');
    break;
    case 5:
    Keyboard.release('d');
    break;
    case 6:
    Keyboard.release('f');
    break;
    case 7:
    Keyboard.release('g');
    break;
    default:
    break;
  }
}
