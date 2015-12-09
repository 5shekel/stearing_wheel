#include "pins.h" //to make varaibles stick
int inByte; //store serial data
void setup(){
  Serial.begin(11520);  // initialize serial communication:

  // this section initalize the pinMode and state of pins
  for(int i=0;i<HpinCount;i++){ //make heptic pins output and off
    pinMode(hepticPin[i][1], OUTPUT);
    pinMode(hepticPin[i][2], OUTPUT);  
    digitalWrite(hepticPin[i][1], LOW);
    digitalWrite(hepticPin[i][2], LOW); 
  }
  for(int i=0;i<PpinCount;i++){ //make sure you connect input pins to 3.3v, 5v is ok but not full res
    pinMode(photoSensPin[i], INPUT);  
    digitalWrite(photoSensPin[i], LOW);
  }
}

void loop(){
  //Hsingle(11,50);

  if (Serial.available() > 0) {  // see if there's incoming serial data:
    inByte = Serial.read();    // read the oldest byte in the serial buffer:
    /*
    if (inByte > 20 && inByte < 46 ) {// if it's  ASCII 72, do somthing
     inByte -= 20;
     //Serial.println(inByte); //back at you
     Hsingle(inByte, 100);
     } 
     */
  }
  if(inByte == 47){ //
    HR_100();
  }
  else if(inByte == 48){
    HR_50();
  }
  else if(inByte == 49){
    HR_20();
  }
  else if(inByte == 57){
    HL_100();
  }
  else if(inByte == 58){
    HL_50();
  }
  else if(inByte == 59){
    HL_20();
  }
    else if(inByte == 88){
    Hblink(1000);
  }
  if(inByte == 99){
    Hstop();
  }

}











