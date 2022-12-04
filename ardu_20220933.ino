void setup() {
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  pinMode(4, INPUT)
}
void loop() {

  static unsigned  long Mil = 0;// 1초를 계산하는 프로그램
  if (millis() - Mil >= 1000) {  // 1초를 계산하는 프로그램
    Mil = millis();             // 1초를 계산하는 프로그램
    int msg = analogRead(A0);
    Serial.println(msg);
  }

  if (Serial.available() > 0) {
    String m = Serial.readStringUntil('\n');
    int led_val = m.toInt()*2;
    digitalWrite(13, HIGH);
    delay(led_val);
    digitalWrite(13, LOW);
    delay(led_val)
  }
}
