
//Sensor de Cor
#define S0 8
#define S1 9
#define S2 10
#define S3 11
#define sensorOut 12

void setup() {

  pinMode(S0, OUTPUT);
  pinMode(S1, OUTPUT);
  pinMode(S2, OUTPUT);
  pinMode(S3, OUTPUT);
  pinMode(out, INPUT);

  digitalWrite(S0, HIGH);
  digitalWrite(S1, LOW);

  Serial.begin(9600);


}

void loop() {
  //vermelho
  digitalWrite(S2, LOW);
  digitalWrite(S3, LOW);
  int redFrequency = pulseIn(sensorOut, LOW);

  //verde
  digitalWrite(S2, HIGH);
  digitalWrite(S3, HIGH);
  int greenFrequency = pulseIn(sensorOut, LOW);

  //azul
  digitalWrite(S2, LOW);
  digitalWrite(S3, HIGH);
  int blueFrequency = pulseIn(sensorOut, LOW);

  //valores rgb
  int redValue = map(redFrequency, 0, 255, 0, 255);
  int greenValue = map(greenFrequency, 0, 255, 0, 255);
  int blueValue = map(blueFrequency, 0, 255, 0, 255);

  Serial.print("R:");
  Serial.print(redValue);
  Serial.print(" G:");
  Serial.print(greenValue);
  Serial.print(" B:");
  Serial.println(blueValue);

  Serial.print(redValue);
  Serial.print(",");
  Serial.print(greenValue);
  Serial.print(",");
  Serial.println(blueValue);

  delay(3000);
}
