void HR_100(){
  HwaveRight(100);
}

void HL_100(){
  HwaveLeft(100);
}

void HR_50(){
  HwaveRight(50);
}

void HL_50(){
  HwaveLeft(50);
}

void HR_20(){
  HwaveRight(20);
}

void HL_20(){
  HwaveLeft(20);
}

void Hstop(){
  for(int i=0;i<HpinCount;i++){                
    digitalWrite(hepticPin[i][1], LOW);   
    digitalWrite(hepticPin[i][2], LOW);
  }
}


void HwaveLeft(int timer){
  //Hstop();//make sure the all stop
  for(int i=0;i<HpinCount;i++){                
    H_pulse(i);                
    delay(timer);
  }
}

void HwaveRight(int timer){
    //Hstop();//make sure the all stop
  for(int i=HpinCount;i>=0;i--){              
    H_pulse(i);                
    delay(timer);
  }
}

void H_pinoff(int pin){
  digitalWrite(hepticPin[pin][1], LOW);   
  digitalWrite(hepticPin[pin][2], LOW);    
}

void H_pulse(int pin){
  digitalWrite(hepticPin[pin][1], LOW);   
  digitalWrite(hepticPin[pin][2], HIGH);  
  delay(pulseWidth); 
  digitalWrite(hepticPin[pin][1], HIGH);   
  digitalWrite(hepticPin[pin][2], LOW); 
  delay(pulseWidth); 
  H_pinoff(pin); 
}

void H_pinBwd(int pin){
  digitalWrite(hepticPin[pin][1], LOW);   
  digitalWrite(hepticPin[pin][2], HIGH);  
  delay(pulseWidth); 
  H_pinoff(pin);   
}
void H_pinFwd(int pin){
  digitalWrite(hepticPin[pin][1], HIGH);   
  digitalWrite(hepticPin[pin][2], LOW); 
  delay(pulseWidth); 
  H_pinoff(pin);    
}


void Hblink(int timer){
  H_pulse(0);
  H_pulse(1);
  H_pulse(4);
  H_pulse(5);  
  H_pulse(8);
  H_pulse(9);  
  H_pulse(12);
  H_pulse(13);  
  H_pulse(16);
  H_pulse(17);  
  H_pulse(20);
  H_pulse(21);  
  H_pulse(24); 
  delay(250);
  H_pulse(2);
  H_pulse(3);
  H_pulse(6);
  H_pulse(7);  
  H_pulse(10);
  H_pulse(11);  
  H_pulse(14);
  H_pulse(15);  
  H_pulse(18);
  H_pulse(19);  
  H_pulse(222);
  H_pulse(23);  
  H_pulse(25); 
  delay(timer);
}

/*
void HwaveLeft(int timer){
 for(int i=HpinCount;i<=0;i--){
 digitalWrite(hepticPin[i][1], LOW);   
 digitalWrite(hepticPin[i][2], HIGH);
 delay(timer);                  
 digitalWrite(hepticPin[i][1], HIGH);   
 digitalWrite(hepticPin[i][2], LOW);  
 delay(timer);                  
 digitalWrite(hepticPin[i][1], LOW);   
 digitalWrite(hepticPin[i][2], LOW);   
 delay(1);
 }
 }
 */





