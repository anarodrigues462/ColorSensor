

import processing.serial.*;

Serial port;  // Objeto para comunicação serial
int canvasWidth = 400;
int canvasHeight = 400;
boolean dataReceived = false;
int r = 0;
int g = 0;
int b = 0;

void setup() {
    // Define o tamanho da janela gráfica
    size(500,500);

    // Lista todas as portas seriais disponíveis
    String[] portList = Serial.list();

    // Verifica se há pelo menos uma porta serial disponível
    if (portList.length > 0) {
        // Seleciona a primeira porta serial disponível
        String portName = "COM8";
        
        // Inicializa a comunicação serial
        port = new Serial(this, portName, 9600);
    } else {
        println("Nenhuma porta serial disponível");
    }
}

void draw() {
    // Se os dados foram recebidos, desenha um retângulo com a cor correspondente
    if (dataReceived) {
      println("Cor recebida: R=" + r + ", G=" + g + ", B=" + b);
      
      if (r <=15 && g <=15 && b <=15){
        background(255);
      } else if (r<b && r<=g && r<23){
        background(255,0,0);
      } else if (b<g && b<r && b<20){
        background(0,255,0);
      } else if (g<r && g-b<= 8) {
        background(0,0,255);
      }
              dataReceived = false;  // Reseta a flag de recebimento de dados
    }
}

void serialEvent(Serial p) {
    // Lê os dados da porta serial até encontrar uma quebra de linha
    String data = p.readStringUntil('\n');
    
    // Se os dados não forem nulos, processa-os
    if (data != null) {
        // Remove espaços em branco e separa os valores R, G, B
        data = data.trim();
        String[] rgb = data.split(",");

        // Verifica se há três valores (R, G, B)
        if (rgb.length == 3) {
            // Converte os valores de string para int
            r = int(rgb[0]);
            g = int(rgb[1]);
            b = int(rgb[2]);

            // Sinaliza que os dados foram recebidos
            dataReceived = true;
        }
    }
}
