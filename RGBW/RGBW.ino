
// Pinos de controle do TCS3200
#define S0 8
#define S1 9
#define S2 10
#define S3 11
#define sensorOut 12

void setup() {
  // Configura os pinos de controle do TCS3200
  pinMode(S0, OUTPUT);
  pinMode(S1, OUTPUT);
  pinMode(S2, OUTPUT);
  pinMode(S3, OUTPUT);
  pinMode(sensorOut, INPUT);


  // Configura o sensor TCS3200 para a frequência de 20%
  digitalWrite(S0, HIGH);
  digitalWrite(S1, LOW);

  // Inicializa a comunicação serial
  Serial.begin(9600);

}

void loop() {
  // Medir a cor vermelha
  digitalWrite(S2, LOW);
  digitalWrite(S3, LOW);
  int redFrequency = pulseIn(sensorOut, LOW);

  // Medir a cor verde
  digitalWrite(S2, HIGH);
  digitalWrite(S3, HIGH);
  int greenFrequency = pulseIn(sensorOut, LOW);

  // Medir a cor azul
  digitalWrite(S2, LOW);
  digitalWrite(S3, HIGH);
  int blueFrequency = pulseIn(sensorOut, LOW);

  // Calcular os valores RGB (ajuste conforme necessário)
  int redValue = map(redFrequency, 0, 255, 0, 255);
  int greenValue = map(greenFrequency, 0, 255, 0, 255);
  int blueValue = map(blueFrequency, 0, 255, 0, 255);

  // Mostrar os valores no Serial Monitor (opcional)
  Serial.print("R:");
  Serial.print(redValue);
  Serial.print(" G:");
  Serial.print(greenValue);
  Serial.print(" B:");
  Serial.println(blueValue);

  // Enviar os valores RGB para o Processing via Serial
  Serial.print(redValue);
  Serial.print(",");
  Serial.print(greenValue);
  Serial.print(",");
  Serial.println(blueValue);


  // Atraso para evitar leitura constante
  delay(1000);
}


// #define s0 8  
// #define s1 9
// #define s2 10
// #define s3 11
// #define out 12

// int  Red=0, Blue=0, Green=0;  

// void setup() 
// {
//    pinMode(s0,OUTPUT);    
//    pinMode(s1,OUTPUT);
//    pinMode(s2,OUTPUT);
//    pinMode(s3,OUTPUT);
//    pinMode(out,INPUT);

     
   
//    digitalWrite(s0, HIGH);
//   digitalWrite(s1, LOW); 
   
//    Serial.begin(9600);
// }

// void loop(){

//   // Medir a cor vermelha
//   digitalWrite(s2, LOW);
//   digitalWrite(s3, LOW);
//   int redFrequency = pulseIn(out, LOW);

//   // Medir a cor verde
//   digitalWrite(s2, HIGH);
//   digitalWrite(s3, HIGH);
//   int greenFrequency = pulseIn(out, LOW);

//   // Medir a cor azul
//   digitalWrite(s2, LOW);
//   digitalWrite(s3, HIGH);
//   int blueFrequency = pulseIn(out, LOW);

//   // Calcular os valores RGB (ajuste conforme necessário)
//   int redValue = map(redFrequency, 0, 255, 0, 255);
//   int greenValue = map(greenFrequency, 0, 255, 0, 255);
//   int blueValue = map(blueFrequency, 0, 255, 0, 255);

//   // Mostrar os valores no Serial Monitor (opcional)
//   Serial.print("R:");
//   Serial.print(redValue);
//   Serial.print(" G:");
//   Serial.print(greenValue);
//   Serial.print(" B:");
//   Serial.println(blueValue);

//   // Enviar os valores RGB para o Processing via Serial
//   Serial.print(redValue);
//   Serial.print(",");
//   Serial.print(greenValue);
//   Serial.print(",");
//   Serial.println(blueValue);

//   delay(1000);
  
//   // GetColors();                                     
                                                   
//   // if (Red > 80 && Red < 125  &&  Green > 90 && Green < 125   &&  Blue > 80 && Blue < 125) 
//   //     Serial.println("Black");                    
      
//   // else if (red > 12 && red < 30   &&  grn > 40 && grn < 70    &&  blu > 33 && blu < 70)    
//   //     Serial.println("Red");

//   // else if (Blue<Green && Blue<Red && Blue<20)  
//   //     Serial.println("Blue");

//   // else if (Green<Red && Green-Blue<= 8)          
//   //     Serial.println("Green");                  

//   // else
//   //    Serial.println("Unknown");                


//   // delay(2000);                                  
  
//   // Serial.print(Red);
//   //   Serial.print(",");
//   //   Serial.print(Green);
//   //   Serial.print(",");
//   //   Serial.println(Blue);
  
// }


// // void GetColors()  
// // {    
// //   digitalWrite(s2,  LOW);                                           
// //   digitalWrite(s3, LOW);                                           
// //   Red = pulseIn(out, digitalRead(out) == HIGH ? LOW : HIGH);       
// //   delay(20);  

// //   digitalWrite(s3, HIGH);                                        
// //   Blue = pulseIn(out, digitalRead(out) == HIGH ? LOW  : HIGH);
// //   delay(20); 

// //   digitalWrite(s2, HIGH);  
// //   Green = pulseIn(out,  digitalRead(out) == HIGH ? LOW : HIGH);
// //   delay(20);  
// // }


