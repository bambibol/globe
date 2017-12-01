#include <CapacitiveSensor.h>

CapacitiveSensor   cs_4_2 = CapacitiveSensor(4, 2);       // 10M resistor between pins 4 & 2, pin 2 is sensor pin, add a wire and or foil if desired


void setup() {
  // put your setup code here, to run once:
  cs_4_2.set_CS_AutocaL_Millis(0xFFFFFFFF);     // turn off autocalibrate on channel 1 - just as an example
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  long total1 =  cs_4_2.capacitiveSensor(30);
  Serial.println(total1);
  delay(10);
}
