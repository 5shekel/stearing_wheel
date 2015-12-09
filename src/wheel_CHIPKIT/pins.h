//here we declare variables
int pulseWidth = 10;
int HpinCount = 26; //numbaer of heptic motors (pins*2)
int hepticPin[26][3] = { 
  {1,13,83},//[ number, pinFWD, pinBWD]
  {2,12,82},
  {3,11,81},
  {4,10,80},
  {5,9,79},
  {6,8,78},
  {7,7,77},
  {8,6,76},
  {9,5,75},
  {10,52,53},
  {11,50,51},
  {12,49,48},
  {13,43,42},
  {14,45,44},
  {15,47,46},
  {16,40,41},
  {17,39,38},
  {18,36,37},
  {19,4,74},
  {20,3,73},
  {21,2,72},
  {22,25,23},
  {23,16,17},
  {24,15,14},
  {25,71,30},
  {26,33,32}
};
int PpinCount = 6; //number of analoge pins in array
int photoSensPin[6]={61,60,59,58,57,54}; //analoge pins see chipkit max32 manual
