// buttons// buttons
const int buttonA = 7;     
const int buttonB =  6;
const int buttonC = 5;     
const int buttonD =  4; 
const int buttonE =  3;     
const int ledPin =  3;     

//Variables
int buttonState = 0;
int flag=0;

void setup() {
  //Input or output?
  pinMode(ledPin, OUTPUT);      
  pinMode(buttonA, INPUT_PULLUP);   
}

void loop(){
  //Read button state (pressed or not pressed?)
  buttonState = digitalRead(buttonA);

  //If button pressed...
  if (buttonState == LOW) { 
    //...ones, turn led on!
    if ( flag == 0){
      digitalWrite(ledPin, HIGH);
      flag=1; //change flag variable
    }
    //...twice, turn led off!
    else if ( flag == 1){
      digitalWrite(ledPin, LOW);
      flag=0; //change flag variable again 
    }    
  }
}
