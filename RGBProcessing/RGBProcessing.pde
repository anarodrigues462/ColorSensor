import processing.serial.*;

Serial myPort;
int redValue = 0;
int greenValue = 0;
int blueValue = 0;

void setup() {
  size(400, 400);
  // Substitua "COM3" pela porta serial correta do seu Arduino
  String portName = "COM8";
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(255);

  // Define a cor do círculo baseado nos valores RGB
  fill(redValue, greenValue, blueValue);

  // Desenha um círculo no centro da tela
  ellipse(width / 2, height / 2, 200, 200);

  // Exibe os valores RGB
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  String colorText = "R: " + redValue + " G: " + greenValue + " B: " + blueValue;
  text(colorText, width / 2, height / 2 + 150);
}

void serialEvent(Serial myPort) {
  // Leitura da linha recebida via Serial
  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    String[] rgbValues = split(inString, ',');
    if (rgbValues.length == 3) {
      redValue = int(rgbValues[0]);
      greenValue = int(rgbValues[1]);
      blueValue = int(rgbValues[2]);
    }
  }
}

//import processing.serial.*;

//Serial port;
//int redValue = 0;
//int greenValue = 0;
//int blueValue = 0;

//boolean dataReceived = false;

//void setup() {
//  size(400, 400);

//  String[] portList = Serial.list();

//  if (portList.length > 0) {

//    String portName = "COM8";

//    port = new Serial(this, portName, 9600);
//  } else {
//    println("Nenhuma porta serial disponível");
//  }
//}

//void draw() {

//  if (dataReceived) {
//    println("Cor recebida: R=" + redValue + ", G=" + greenValue + ", B=" + blueValue);

//    background(redValue, greenValue, blueValue);
//  } else {
//    println("valor não recebido");
//    background(255);
//  }
//}

//void serialEvent(Serial myPort) {

//  String inString = myPort.readStringUntil('\n');
//  if (inString != null) {
//    inString = trim(inString);
//    String[] rgbValues = split(inString, ',');
//    if (rgbValues.length == 3) {
//      redValue = int(rgbValues[0]);
//      greenValue = int(rgbValues[1]);
//      blueValue = int(rgbValues[2]);

//      dataReceived = true;
//    }
//  }
//}
