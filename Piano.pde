// * * * * * * * * * * * * 
// * Rightmost piano keyboard
// * * * * * * * * * * * * 
class Piano {

  PianoKey[]whiteKey;
  PianoKey[]blackKey;

  AudioSample temp;
  int w=180;
  int h=50;
  char []keys={'a', 'b', 'c', 'd', 'e', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p'};
  // * * * * * * * * * * * * * * 
  // * Import piano keyboard sound
  // * * * * * * * * * * * * * * 
  String []sam={"21-F.mp3","23-G.mp3","25-A.mp3","27-B.mp3","28-C.mp3","30-D.mp3","32-E.mp3","33-F.mp3","35-G.mp3","37-A.mp3","39-B.mp3","40-C.mp3","42-D.mp3","44-E.mp3","45-F.mp3","47-G.mp3"};
  String []note={};
  Piano()
  {
    whiteKey=new PianoKey[16];
    blackKey=new PianoKey[10];
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    // * Determine the position of the piano's white keys
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    for (int i=0; i<whiteKey.length; i++)
    {
      whiteKey[i]=new PianoKey(sam[i], 1455, 70+h*i, 180, h, keys[i], 1);
    }
    //whiteKey[0]=new PianoKey("21-F.mp3", 1255, 70, 160, 35, 'a'); 
    //whiteKey[1]=new PianoKey("23-G.mp3", 50, 280, 66, 388, 'b');
    //whiteKey[2]=new PianoKey("25-A.mp3", 100, 280, 66, 388, 'c');
    //whiteKey[3]=new PianoKey("27-B.mp3", 150, 280, 66, 388, 'd');
    //whiteKey[4]=new PianoKey("28-C.mp3", 200, 280, 66, 388, 'e');
    //whiteKey[5]=new PianoKey("30-D.mp3", 250, 280, 66, 388, 'f');
    //whiteKey[6]=new PianoKey("32-E.mp3", 300, 280, 66, 388, 'g');
    //whiteKey[7]=new PianoKey("33-F.mp3", 350, 280, 66, 388, 'h');
    //whiteKey[8]=new PianoKey("35-G.mp3", 400, 280, 66, 388, 'i');
    //whiteKey[9]=new PianoKey("37-A.mp3", 450, 280, 66, 388, 'j');
    //whiteKey[10]=new PianoKey("39-B.mp3", 500, 280, 66, 388, 'k');
    //whiteKey[11]=new PianoKey("40-C.mp3", 550, 280, 66, 388, 'l');
    //whiteKey[12]=new PianoKey("42-D.mp3", 600, 280, 66, 388, 'm');
    //whiteKey[13]=new PianoKey("44-E.mp3", 650, 280, 66, 388, 'n');
    //whiteKey[14]=new PianoKey("45-F.mp3", 700, 280, 66, 388, 'o');
    //whiteKey[15]=new PianoKey("47-G.mp3", 750, 280, 66, 388, 'p');
    
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    // * Determine the position of the piano's black keys
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    blackKey[0]=new PianoKey("22-F#.mp3", 1455, 105, 120, 25, 'q', 0);
    blackKey[1]=new PianoKey("24-G#.mp3", 1455, 105+h, 120, 25, 'r', 0);
    blackKey[2]=new PianoKey("26-A#.mp3", 1455, 105+3*h, 120, 25, 's', 0);
    blackKey[3]=new PianoKey("29-C#.mp3", 1455, 105+4*h, 120, 25, 't', 0);
    blackKey[4]=new PianoKey("31-D#.mp3", 1455, 105+5*h, 120, 25, 'u', 0);
    blackKey[5]=new PianoKey("34-F#.mp3", 1455, 105+7*h, 120, 25, 'v', 0);
    blackKey[6]=new PianoKey("36-G#.mp3", 1455, 105+8*h, 120, 25, 'w', 0);
    blackKey[7]=new PianoKey("38-A#.mp3", 1455, 105+10*h, 120, 25, 'x', 0);
    blackKey[8]=new PianoKey("41-C#.mp3", 1455, 105+11*h, 120, 25, 'y', 0);
    blackKey[9]=new PianoKey("46-F#.mp3", 1455, 105+12*h, 120, 25, 'z', 0);
  }
  boolean mouseOnBlack() {
    for (int i=0; i<blackKey.length; i++) {
      if (blackKey[i].isHover()) {
        return true;
      }
    }
    return false;
  }
  // * * * * * * * * * * 
  // * Draw piano keyboard
  // * * * * * * * * * * 
  void display()
  {
    for (int i=0; i<whiteKey.length; i++) {
      whiteKey[i].update();
      whiteKey[i].display();
    }

    for (int i=0; i<blackKey.length; i++) {
      blackKey[i].update();
      blackKey[i].display();
    }
  }
  
 // * * * * * * * * * * 
 // * Piano click event
 // * * * * * * * * * * 
  void hitk()
  {

    for (int i=0; i<blackKey.length; i++) {
      if (blackKey[i].isHover()) {
        blackKey[i].hitKey();
      }
    }

    if (mouseOnBlack()==false) { 
    // See if the black key is triggered first, then trigger the white key if not
      for (int i=0; i<whiteKey.length; i++) {
        if (whiteKey[i].isHover()) {
          whiteKey[i].hitKey();
        }
      }
    }
  }
}




class PianoKey {
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
  // * Various parameters on the piano keyboard, such as position color, etc.
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
  int xpos;
  int ypos;
  int wd;
  int ht;
  // * * * * * * * * * *   
  // * Key default color
  // * * * * * * * * * *   
  color bgCl; 
  
  // * * * * * * * * * * * * * * *
  // * turns this color when keyed
  // * * * * * * * * * * * * * * *
  color hitCl;  
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
  // * Color in two layers, the lower layer of the default color, the upper layer of translucent hitCl, here is the transparency of the upper layer of color
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
  float alfa;
  
  char keys;
  int state;
  AudioSample sample;

  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  // * String is a string data type, the file name is a string
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  PianoKey(String sampleName, int _xpos, int _ypos, int _wd, int _ht, char keys, int state) {  

    sample=minim.loadSample(sampleName);
    xpos=_xpos;
    ypos=_ypos;
    wd=_wd;
    ht=_ht;
    this.state=state;
    this.keys=keys;
    if (state==1) { 
    //White Key
      bgCl=color(255);
      hitCl=color(255, 0, 0);
    } else {    
     // Black Key 
      bgCl=color(0);
      hitCl=color(255);
    }
    alfa=0;
  }
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
  // * Determine if the mouse is hovering over the piano keyboard
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
   boolean isHover() { 
    if (mouseX>xpos && mouseX<xpos+wd &&
      mouseY>ypos && mouseY<ypos+ht) {
      return true;
    } else {
      return false;
    }
  }
  
  // * * * * * * * * * * * * * * * * * * * * * * * * *
  // * Click on the piano keyboard to trigger an event
  // * * * * * * * * * * * * * * * * * * * * * * * * *
  void hitKey() {
    alfa=180;
    sample.trigger();
  }
  // * * * * * * * * * * * * * * * * * * * * *
  // * Click the piano keyboard update event
  // * * * * * * * * * * * * * * * * * * * * *
  void update() {
    alfa+=(0-alfa)*0.1;
  }
  // * * * * * * * * * * * * 
  // * Draw piano keyboard
  // * * * * * * * * * * * * 
  void display() {
    stroke(Gui[5]);
    strokeWeight(1);
    fill(bgCl);
    rect(xpos, ypos, wd, ht);
    fill(hitCl, alfa);
    rect(xpos, ypos, wd, ht);
  }
}
