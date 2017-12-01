const int buttonPin = 4;
const int ledPin =  8;

int buttonState = 0;

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(ledPin, OUTPUT);
  pinMode(buttonPin, INPUT);
}

// the loop function runs over and over again forever
void loop() {
  buttonState = digitalRead(buttonPin);

 if (buttonState == HIGH) {
    // turn LED on:
    digitalWrite(ledPin, HIGH);
  } else {
    // turn LED off:
    digitalWrite(ledPin, LOW);
  }
}
