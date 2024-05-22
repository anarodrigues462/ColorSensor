

import processing.serial.*;

Serial port; 
int canvasWidth = 400;
int canvasHeight = 400;
boolean dataReceived = false;
int r = 0;
int g = 0;
int b = 0;

void setup() {
    
    size(500,500);

   
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
      println("Cor recebida: R=" + r + ", G=" + g + ", B=" + b);
      
      background(r,g,b);
      
     
    }
}

void serialEvent(Serial p) {

    String data = p.readStringUntil('\n');
    
    if (data != null) {
      
        data = data.trim();
        String[] rgb = data.split(",");

        if (rgb.length == 3) {
          
            r = int(rgb[0]);
            g = int(rgb[1]);
            b = int(rgb[2]);

            dataReceived = true;
        }
    }
}
