
#include <Elapsed.h> //http://www.gammon.com.au/forum/?id=11094
boolean DEBUG=true;

static Elapsed time [12]; 

int Hstate[12];  //mini state machine for inside the timer function H_pulseWave
int startWave=0;
int endWave=12;

// just some pins configured...
int HpinCount = 12;
int hepticPin[12][3] = { 
  {
    1,5,6                                      }
  ,{
    2,7,8                                      }
  ,{
    2,7,8                                      }
  ,{
    2,7,8                                      } 
  ,{
    1,5,6                                      }
  ,{
    2,7,8                                      }
  ,{
    2,7,8                                      }
  ,{
    2,7,8                                      } 
  ,{
    1,5,6                                      }
  ,{
    2,7,8                                      }
  ,{
    2,7,8                                      }
  ,{
    2,7,8                                      } 
};

int seq1[]={
  0,4,8,12,16,20,24};
int seq2[]={
  1,5,9,13,17,21,25};
int seq3[]={
  2,6,10,14,18,22};
int seq4[]={
  3,7,11,15,19,23};

int intrvl_kick = 1000; 
int intrvlOFF = 50; 
int intrvlON = 100;

void setup(){
  Serial.begin(19200);  // initialize serial communication:
  Serial.println("init");
  Hstate[0]=1;
  Hstate[3]=99;
  time[0].reset();
}

void loop(){
  if(Hstate[3]==99)H_pulseSeq1();
  if(Hstate[0]==99)H_pulseSeq2();
  if(Hstate[1]==99)H_pulseSeq3();
  if(Hstate[2]==99)H_pulseSeq4();

}

void H_pulseSeq1(){
  if( Hstate[0]==0)    time[0].reset(); 
  if(time[0].intervalMs() > intrvl_kick && Hstate[0]==1)
  {
    for(int i=0;i<8;i++){
      H_bwd(seq1[i]);
    }
    Hstate[0]=2;
  }
  if(time[0].intervalMs() > intrvl_kick+intrvlOFF && Hstate[0]==2) //50
  {
    for(int i=0;i<8;i++){
      H_fwd(seq1[i]);
    }
    Hstate[0]=3;
  }

  if(time[0].intervalMs() > intrvl_kick+intrvlOFF+intrvlON && Hstate[0]==3) //15
  {

    for(int i=0;i<8;i++){
      H_off(seq1[i]);
    }
    Hstate[0]=99; // make this offline , will check this on the main loop
    Hstate[1]=1;
    time[1].reset();
  }

}


void H_pulseSeq2(){
  if( Hstate[1]==0)    time[1].reset(); 
  if(time[1].intervalMs() > intrvl_kick && Hstate[1]==1)
  {
    for(int i=0;i<8;i++){
      H_bwd(seq1[i]);
    }
    Hstate[1]=2;
  }
  if(time[1].intervalMs() > intrvl_kick+intrvlOFF && Hstate[1]==2) //50
  {
    for(int i=0;i<8;i++){
      H_fwd(seq1[i]);
    }
    Hstate[1]=3;
  }

  if(time[1].intervalMs() > intrvl_kick+intrvlOFF+intrvlON && Hstate[1]==3) //15
  {

    for(int i=0;i<8;i++){
      H_off(seq1[i]);
    }
    Hstate[1]=99; // make this offline , will check this on the main loop
    Hstate[2]=1;
    time[2].reset();
  }

}



void H_pulseSeq3(){
  if( Hstate[2]==0)    time[2].reset(); 
  if(time[2].intervalMs() > intrvl_kick && Hstate[2]==1)
  {
    for(int i=0;i<8;i++){
      H_bwd(seq1[i]);
    }
    Hstate[2]=2;
  }
  if(time[2].intervalMs() > intrvl_kick+intrvlOFF && Hstate[2]==2) //50
  {
    for(int i=0;i<8;i++){
      H_fwd(seq1[i]);
    }
    Hstate[2]=3;
  }

  if(time[2].intervalMs() > intrvl_kick+intrvlOFF+intrvlON && Hstate[2]==3) //15
  {

    for(int i=0;i<8;i++){
      H_off(seq1[i]);
    }
    Hstate[2]=99; // make this offline , will check this on the main loop
    Hstate[3]=1;
    time[3].reset();
  }

}



void H_pulseSeq4(){
  if( Hstate[3]==0)    time[3].reset(); 
  if(time[3].intervalMs() > intrvl_kick && Hstate[3]==1)
  {
    for(int i=0;i<8;i++){
      H_bwd(seq1[i]);
    }
    Hstate[3]=2;
  }
  if(time[3].intervalMs() > intrvl_kick+intrvlOFF && Hstate[3]==2) //50
  {
    for(int i=0;i<8;i++){
      H_fwd(seq1[i]);
    }
    Hstate[3]=3;
  }

  if(time[3].intervalMs() > intrvl_kick+intrvlOFF+intrvlON && Hstate[3]==3) //15
  {

    for(int i=0;i<8;i++){
      H_off(seq1[i]);
    }
    Hstate[3]=99; // make this offline , will check this on the main loop
    Hstate[0]=1;
    time[0].reset();
  }

}

void B_reset(){//with no reset of first pin
  for(int i=0;i < HpinCount;i++){  
    Hstate[i]=0;      
    time[i].reset();
  }
  if(DEBUG)Serial.println("bbbblink");
}



void H_bwd(int pin){
  digitalWrite(hepticPin[pin][1], LOW);  

}
void H_fwd(int pin){
  digitalWrite(hepticPin[pin][1], HIGH);   

}

void H_off(int pin){
  digitalWrite(hepticPin[pin][1], LOW);   

}






















