#include <Keyboard.h>



int keys[] = {2, 5};

void setup() {
 // put your setup code here, to run once:
 Keyboard.begin(); // setup keyboard
 for (int i = 2; i < 11; ++i) {
 // initilize pins
 pinMode(i, INPUT);
 }
}

void loop() {
 // put your main code here, to run repeatedly:
 for (int i = 2; i < 11; ++i) {
 // check buttons
 if(readButton(i)) {
 doAction(i);
 }
 }
}

boolean readButton(int pin) {
 // check and debounce buttons
 if (digitalRead(pin) == HIGH) {
 delay(10);
 if (digitalRead(pin) == HIGH) {
 return true;
 }
 }
 return false;
}

void doAction(int pin) {
 // perform tasks
 switch (pin) {
 case 2:
 Keyboard.println("drive.google.com");
 break;
 case 3:
 Keyboard.println("makeuseof.com");
 break;
 case 4:
 // CMD + T (new tab, Chrome)
 Keyboard.press(KEY_LEFT_GUI);
 Keyboard.press('t');
 delay(100);
 Keyboard.releaseAll();
 break;
 case 5:
 Keyboard.println("makeuseof.com");
 break;
 case 6:
 Keyboard.println("makeuseof.com");
 break;
 case 7:
  Keyboard.println("makeuseof.com");
 break;
 case 8:
 Keyboard.println("makeuseof.com");
 break;
 case 9:
  Keyboard.println("makeuseof.com");
 break;

}
}
