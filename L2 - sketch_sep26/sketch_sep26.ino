int sampleRate = 1000 / 200; // 1000 = 1 second, so in this case 200 times per second

void setup() {
  // put your setup code here, to run once:
  
  pinMode(A5, INPUT);
  Serial.begin(9600); // set up communication w/ other computer
}

void loop() {
  // put your main code here, to run repeatedly:
  
  int reading = analogRead(A5);
  Serial.println(reading);
  delay(sampleRate);
}
