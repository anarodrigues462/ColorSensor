import processing.serial.*;

Serial port;
int redValue = 0;
int greenValue = 0;
int blueValue = 0;

void setup() {
  size(400, 400);
  // Substitua "COM3" pela porta serial correta do seu Arduino
  String[] portList = Serial.list();
    
    if (portList.length > 0) {
        
        String portName = "COM8";
        
        
        port = new Serial(this, portName, 9600);
    } else {
       println("Nenhuma porta serial disponível");
   }
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
//int canvasWidth = 400;
//int canvasHeight = 400;
//boolean dataReceived = false;
//int r = 0;
//int g = 0;
//int b = 0;

//void setup() {
    
//    size(400,400);

   
//    String[] portList = Serial.list();
    
//    if (portList.length > 0) {
        
//        String portName = "COM8";
        
        
//        port = new Serial(this, portName, 9600);
//    } else {
//        println("Nenhuma porta serial disponível");
//    }
//}

//void draw() {
    
//    if (dataReceived) {
//      println("Cor recebida: R=" + r + ", G=" + g + ", B=" + b);
      
//      background(r,g,b);
      
     
//    }
//}

//void serialEvent(Serial p) {

//    String data = p.readStringUntil('\n');
    
//    if (data != null) {
      
//        data = data.trim();
//        String[] rgb = data.split(",");

//        if (rgb.length == 3) {
          
//            r = int(rgb[0]);
//            g = int(rgb[1]);
//            b = int(rgb[2]);

//            dataReceived = true;
//        }
//    }
//}
