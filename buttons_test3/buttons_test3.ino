#include <Keyboard.h>

const int buttonPin[] = {2, 5};
int pinCount = 4;
int buttonState[] = {0, 0};
int prevButtonState[] = {HIGH, HIGH};

long lastDebounceTime[] = {0, 0};
long debounceDelay = 50;
void setup() {
  for (int thisPin = pinCount - 1; thisPin >= 0; thisPin--) {
    pinMode(buttonPin[thisPin], INPUT);
    digitalWrite(buttonPin[thisPin], HIGH);
  }
  Keyboard.begin();
}

// Output actions. Probably the only part that you need to change
int outputAction(int currentButton) {
    if (currentButton == 1) {
   
      Keyboard.press('a');
      delay(100);
      Keyboard.releaseAll();
    }
    if (currentButton + 1 == 2) {

      Keyboard.press('b');
      delay(100);
      Keyboard.releaseAll();
    }
}
void loop() {
  for (int thisPin = pinCount - 1; thisPin >= 0; thisPin--) {
    buttonState[thisPin] = digitalRead(buttonPin[thisPin]);

    if ((buttonState[thisPin] != prevButtonState[thisPin]) && (buttonState[thisPin] == HIGH)) {
      if ((millis() - lastDebounceTime[thisPin]) > debounceDelay) {
        outputAction(thisPin);
        lastDebounceTime[thisPin] = millis();
      }
    }

    prevButtonState[thisPin] = buttonState[thisPin];
  }
}
