void setup() {
  Serial.begin(9600);
  pinMode(2, INPUT);
  pinMode(5, INPUT);
}
 
void loop() {
  int sensorValueA = digitalRead(2);
  Serial.println(sensorValueA, DEC);
  int sensorValueB = digitalRead(5);
  Serial.println(sensorValueB, DEC);
}
