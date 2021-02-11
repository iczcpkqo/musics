PImage s;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
Fr f;
Line line;
Piano p;
GUI gui;
AudioPlayer in;
AudioMetaData meta;
AudioOutput out;
AudioOutput OSCout;
float MixLevel;
String  []MusicName={"1.mp3", "2.mp3", "3.mp3", "4.mp3", "5.mp3", "6.mp3", "7.mp3", "8.mp3"};
String CurrentName;
Particle []ps=new Particle[15];
PImage tIcon1;
PImage tIcon2;
PFont font;
PFont font2;
public color []Gui=new color[8];
PImage []De=new PImage[20];
PImage []sH=new PImage[20];
PImage []dd=new PImage[20];
PImage []hx=new PImage[20];

Sampler     kick;
Sampler     snare;
Sampler     hat;
Sampler     kick2;
Sampler     snare2;
Sampler     hat2;
Gain       kickgain;
Gain       snaregain;
Gain       hatgain;
Delay kickDelay;
Delay snareDelay;
Delay hatDelay;
TickRate kickrateControl;
TickRate snarerateControl;
TickRate hatrateControl;
Pan pan;
ToneInstrument myNote;
TriangleInstrument myNote2;
SQUAREInstrument myNote3;

boolean kickLoud=true;
boolean snareLoud=true;
boolean hatLoud=true;

boolean[] hatRow = new boolean[16];
boolean[] snrRow = new boolean[16];
boolean[] kikRow = new boolean[16];


int bpm = 120;

// * * * * * * * * * * 
// * which beat we're on
// * * * * * * * * * * 
int beat; 

ArrayList<Rect> buttons = new ArrayList<Rect>();

int MidiStep=28;

int skip=0;
boolean lin=false;
float posx2=0;
void setup()
{
  // * * * * * * * * * * * * * * 
  // * Set window size and position
  // * * * * * * * * * * * * * * 
  size(1635, 970);
  textAlign(CENTER, CENTER);

  // * * * * * *
  // * Set font
  // * * * * * *
  font=createFont("SOURCEHANSANSCN-HEAVY.OTF", 30);
  font2=createFont("SOURCEHANSANSCN-HEAVY.OTF", 10);
  textFont(font);

  // * * * * * * * * * * * *
  // * Set background image
  // * * * * * * * * * * * *
  s=loadImage("s.png");

  // * * * * * * * * *
  // * Set button image
  // * * * * * * * * *
  tIcon1=loadImage("t1.png");
  tIcon2=loadImage("t2.png");

  minim = new Minim(this);

  // * * * * * * * * * * * * * * * * * * * * * * * * * 
  // * Setting up the drum machine/synthesizer section
  // * * * * * * * * * * * * * * * * * * * * * * * * * 
  out = minim.getLineOut();

  OSCout = minim.getLineOut( Minim.MONO, 2048 );
  //gain = new Gain(0.f);
  kickDelay= new Delay(0.4, 0.5, true, true );
  snareDelay= new Delay(0.4, 0.5, true, true );
  hatDelay= new Delay( 0.4, 0.5, true, true );

  // * * * * * * * * * * 
  // start the sequencer
  // * * * * * * * * * * 
  kick  = new Sampler( "BD.wav", 4, minim );
  snare = new Sampler( "SD.wav", 4, minim );
  hat   = new Sampler( "CHH.wav", 4, minim );

  kickrateControl = new TickRate(1.f);
  snarerateControl= new TickRate(1.f);
  hatrateControl= new TickRate(1.f);
  //  kick2  = new Sampler( "kick.wav", 4, minim );
  //  snare2 = new Sampler( "snare.wav", 4, minim );
  //  hat2   = new Sampler( "hihat.wav", 4, minim );
  kickgain = new Gain(0.f);
  snaregain = new Gain(0.f);
  hatgain = new Gain(0.f);
  //kick.patch(gain).patch( myDelay ).patch( out );
  //snare.patch(pan.pan).patch(gain) .patch( myDelay ).patch( out);
  //hat.patch(pan.pan).patch(gain).patch( myDelay ).patch(out );
  kick.patch( kickDelay ).patch( kickgain ).patch( kickrateControl ).patch( out );
  snare.patch( snareDelay ).patch( snaregain ).patch( snarerateControl ).patch( out);
  hat.patch( hatDelay ).patch( hatgain ).patch( hatrateControl ).patch( out );
  //kick2.patch( kickDelay ).patch( kickgain ).patch( out );
  //snare2.patch( snareDelay ).patch( snaregain ).patch( out);
  //hat2.patch( hatDelay ).patch( hatgain ).patch( out );
   
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  // * How to control the three voice synthesizers: Tone, Triangle, and SQUare
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  myNote = new ToneInstrument( 415.3f, 0.9, OSCout );
  myNote2=new TriangleInstrument( "E4 ", 0.45, OSCout );
  myNote3=new SQUAREInstrument( "C4 ", 0.45, OSCout );
  // * * * * * * * * * * * * * * * * * * * * 
  // * set up the position of synthesizer botton
  // * * * * * * * * * * * * * * * * * * * * 
  for (int i = 0; i < 16; i++)
  {
    buttons.add( new Rect(862+i*MidiStep, 100, snrRow, i ) );
    buttons.add( new Rect(862+i*MidiStep, 150, kikRow, i ) );
    buttons.add( new Rect(862+i*MidiStep, 200, hatRow, i ) );
  }

  beat = 0;
  out.setTempo( bpm );
  out.playNote( 0, 0.25f, new Tick() );

  //========================

  // * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  // * Set the color of various components in the control panel
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  Gui[0]=color(#F8fe29);
  Gui[1]=color(#c8f424);
  Gui[2]=color(#5BAB3C);
  Gui[3]=color(#4B713F);
  Gui[4]=color(#244E30);
  Gui[5]=color(#0B2918);
  //Gui[6]=color(#03fedd);
  //Gui[7]=color(#5d0dd8);

  
  // * * * * * * * * * *
  // * load the first music
  // * * * * * * * * * *
  in=minim.loadFile("test.mp3", 1024);
  
  // * * * * * * * * * * * * * * * * 
  // * get the matedata of the music
  // * * * * * * * * * * * * * * * * 
  meta = in.getMetaData();
  //in.loop();
  f=new Fr();
  line=new Line();
  p=new Piano();
  gui=new GUI(this);
  gui.createGUI();

  // * * * * * * * * * * * * * * * * * * * * * 
  // * draw particle on the control panel
  // * * * * * * * * * * * * * * * * * * * * * 
  for (int i=0; i<ps.length; i++)
  {
    ps[i]=new Particle(random(100, 450), random(300, 650));
  }

  loadImg();

  kickDelay.setDelTime(0.0001);
  snareDelay.setDelTime(0.0001);
  hatDelay.setDelTime(0.0001);
}

void draw()
{
  // * * * * * * * * * * * * * * * * * * * * * 
  // * set background color,size,Graphics etc
  // * * * * * * * * * * * * * * * * * * * * * 
  background(Gui[4]);
  //image(dd[11], 775, 552);
  //image(dd[12], -1747, 74);
  MixLevel=in.mix.level()*300;
  //image(s, 0, 0);
  noStroke();
  fill(color(#605d5d));
  fill(Gui[3]);
  rect(0, 0, width/2, 70);
  fill(Gui[5]);
  rect(width/2-400, 0, width, 70);

  noStroke();
  fill(color(Gui[5]));
  rect(45, 82, 455, 680);

  f.drawFr(new PVector(276, 420));
  f.Drawjdt();
  line.run();
  p.display();

  fill(Gui[4]);
  noStroke();
  rect(500, 82, 100, 680);
  rect(0, 82, 45, 680);

  rect(540, 460, 70, 765-460);
  rect(640, 460, 70, 765-460);


  // * * * * * * * * * *
  // * set particle display
  // * * * * * * * * * *
  for (Particle p : ps)
  {
    p.display();
  }
  gui.UI();
  setImage();

  MIDI();

  int xp=580;
  int yp=518;
  int yi = 15;

  noStroke();
  fill(Gui[5], 120);
  rect(522, 470, 132, 285);
  
  // * * * * * * * * * *
  // * set all texts info
  // * * * * * * * * * *
  textSize(10);
  fill(Gui[0]);
  text("File Name: ", 5+xp, yp);
  text(meta.fileName(), 5+xp,yp+=yi);
  text("Title: ", 5+xp, yp+=yi);
  text(meta.title(), 5+xp, yp+=yi);
  text("Author: ", 5+xp, yp+=yi);
  text(meta.author(), 5+xp, yp+=yi);
  text("Album: " + meta.album(), 5+xp, yp+=yi);
  text("Date: " + meta.date(), 5+xp, yp+=yi);
  text("Lyrics: " + meta.lyrics(), 5+xp, yp+=yi );
  text("Track: " + meta.track(), 5+xp, yp+=yi);
  text("Genre: " + meta.genre(), 5+xp, yp+=yi);
  text("Copyright: " + meta.copyright(), 5+xp, yp+=yi);
  text("Disc: " + meta.disc(), 5+xp, yp+=yi);
}

void MIDI()
{
  // * * * * * * * * * *
  // * draw botton
  // * * * * * * * * * *
  for (int i = 0; i < buttons.size(); ++i)
  {
    buttons.get(i).draw();
  }

  
  stroke(128);
  if ( beat % 4 == 0 )
  {
    fill(200, 0, 0);
  } else
  {
    fill(0, 200, 0);
  }

  // * * * * * * * * * *
  // * beat marker
  // * * * * * * * * * *
  stroke(Gui[1]);
  line(862+beat*MidiStep, 90, 862+beat*MidiStep, 200);
}

// * * * * * * * * * *
// * Keyboard click event
// * * * * * * * * * *
void keyPressed() {
  p.hitk();
}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
// * Click in the playback progress to control the progress of the song
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
void mousePressed()
{
  for (int i = 0; i < buttons.size(); ++i)
  {
    buttons.get(i).mousePressed();
  }

  if (mouseX<340-15&&mouseX>60&&mouseY>800-15&&mouseY<815)
  {
    posx2 = map(mouseX, 45+15, 340-15, 0, in.length());
    skip=(int)(posx2-in.position());
    in.skip(skip);
  }

  p.hitk();
}


// * * * * * * * * * * * * * * *
// * Import pictures in a loop
// * * * * * * * * * * * * * * *
void loadImg()
{
  for (int i=0; i<6; i++)
  {
    De[i]=loadImage("d"+i+".png");
  }
  for (int i=0; i<6; i++)
  {
    sH[i]=loadImage("s"+(i+1)+".png");
  }
  for (int i=0; i<6; i++)
  {
    hx[i]=loadImage("h"+i+".png");
  }
  for (int i=0; i<18; i++)
  {
    dd[i]=loadImage("k"+(i+1)+".png");
  }
}
