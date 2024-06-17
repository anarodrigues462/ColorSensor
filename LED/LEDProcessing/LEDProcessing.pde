
import processing.serial.*;

Serial myPort;

int backgroundColor = 0;

void setup() {
  fullScreen(); 
  String[] portList = Serial.list();

if (portList.length > 0) {

    String portName = "COM8";

   myPort = new Serial(this, portName, 9600);
  } else {
    println("Nenhuma porta serial disponível");
  } 
}

void draw() {
  if (myPort.available() > 0) {
    String data = myPort.readStringUntil('\n'); 
    String[] parts = split(data, ','); 
    int colorIndex = int(parts[0]); 

    switch (colorIndex) {
      case 5:
        backgroundColor = color(255, 0, 0);
        break;
      case 6:
        backgroundColor = color(0, 255, 0);
        break;
      case 7:
        backgroundColor = color(0, 0, 255);
        break;
      default:
        backgroundColor = color(0, 0, 0); 
    }
  }

  background(backgroundColor);
}
