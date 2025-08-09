
#include <Servo.h>

Servo servo1, servo2, servo3, servo4;
String inputString = "";

void setup() {
  Serial.begin(9600);
  servo1.attach(3);
  servo2.attach(5);
  servo3.attach(6);
  servo4.attach(9);
}

void loop() {
  if (Serial.available()) {
    inputString = Serial.readStringUntil('\n');
    parseCommand(inputString);
  }
}

void parseCommand(String command) {
  int m1 = command.indexOf("M1:");
  int m2 = command.indexOf("M2:");
  int m3 = command.indexOf("M3:");
  int m4 = command.indexOf("M4:");

  if (m1 >= 0) servo1.write(command.substring(m1 + 3, command.indexOf(",", m1)).toInt());
  if (m2 >= 0) servo2.write(command.substring(m2 + 3, command.indexOf(",", m2)).toInt());
  if (m3 >= 0) servo3.write(command.substring(m3 + 3, command.indexOf(",", m3)).toInt());
  if (m4 >= 0) servo4.write(command.substring(m4 + 3).toInt());
}
