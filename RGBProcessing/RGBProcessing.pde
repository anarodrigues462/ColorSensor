import processing.serial.*;

Serial port;
int redValue = 0;
int greenValue = 0;
int blueValue = 0;

boolean dataReceived = false;

void setup() {
  size(400, 400);

  String[] portList = Serial.list();

  if (portList.length > 0) {

    String portName = "COM8";

    port = new Serial(this, portName, 9600);
  } else {
    println("Nenhuma porta serial disponível");
  }
}

void draw() {

  if (dataReceived) {
    println("Cor recebida: R=" + redValue + ", G=" + greenValue + ", B=" + blueValue);

    background(redValue, greenValue, blueValue);
  }
  else {
    println("valor não recebido");
    background(255);
  }
}

void serialEvent(Serial myPort) {

  String inString = myPort.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    String[] rgbValues = split(inString, ',');
    if (rgbValues.length == 3) {
      redValue = int(rgbValues[0]);
      greenValue = int(rgbValues[1]);
      blueValue = int(rgbValues[2]);
      
      dataReceived = true;
    }
  }
}  
