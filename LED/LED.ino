#define s0 8
#define s1 9
#define s2 10
#define s3 11
#define sensorOut 12

//LED RGB para detetar a cor
#define LED_RED 5
#define LED_GREEN 6
#define LED_BLUE 7

int Red;
int Green;
int Blue;

const int colorRed = (255, 0, 0);
const int colorGreen = (0, 255, 0);
const int colorBlue = (0, 0, 255);

int color = 0;

void setup() {
  pinMode(s0, OUTPUT);
  pinMode(s1, OUTPUT);
  pinMode(s2, OUTPUT);
  pinMode(s3, OUTPUT);
  pinMode(sensorOut, INPUT);

  digitalWrite(s0, HIGH);
  digitalWrite(s1, LOW);

  Serial.begin(9600);
}

void loop() {
  //vermelho
  digitalWrite(s2, LOW);
  digitalWrite(s3, LOW);
  Red = pulseIn(sensorOut, digitalRead(sensorOut) == HIGH ? LOW : HIGH);

  //verde
  digitalWrite(s3, HIGH);
  digitalWrite(s2, HIGH);
  Green = pulseIn(sensorOut, digitalRead(sensorOut) == HIGH ? LOW : HIGH);

  //azul
  digitalWrite(s3, LOW);
  digitalWrite(s3, HIGH);
  Blue = pulseIn(sensorOut, digitalRead(sensorOut) == HIGH ? LOW : HIGH);

  if (Red > Green && Red > Blue) {
    color = colorRed;
  } else if (Green > Red && Green > Blue) {
    color = colorGreen;  
  } else if (Blue > Red && Blue > Green) {
    color = colorBlue;  
  } else {
    color = 0;
  }


  if (color == colorRed) {
    setColor(255, 0, 0); 
  } else if (color == colorGreen) {
    setColor(0, 255, 0); 
  } else if (color == colorBlue) {
    setColor(0, 0, 255); 
  } else {
    setColor(0, 0, 0);
  }

Serial.print(color);
  Serial.print(",");
  Serial.print(Red);
  Serial.print(",");
  Serial.print(Green);
  Serial.print(",");
  Serial.println(Blue);
  
  delay(500);
}

void setColor(int Red, int Green, int Blue) {
  analogWrite(LED_RED, Red);
  analogWrite(LED_GREEN, Green);
  analogWrite(LED_BLUE, Blue);
}
