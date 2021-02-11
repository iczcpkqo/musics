import controlP5.*;
import java.util.*;
class GUI {

  ControlP5 cp5;

  GUI(PApplet thePApplet)
  {
    cp5 = new ControlP5(thePApplet);
  }
  
  // * * * * * * * * * * * * * * * * * * * * 
  // * Create various tuning components
  // * * * * * * * * * * * * * * * * * * * * 
  void createGUI()
  {
    List l = Arrays.asList("The Cure", "River Flows In You", "Rap Beat 2", "Lifeline");
    // List l = Arrays.asList("a", "b", "c");
    // * * * * * * * * * * * * * * * * * * * * 
    // * create play list
    // * * * * * * * * * * * * * * * * * * * * 
    cp5.addScrollableList("Music_List")
      .setPosition(355, 785)
      .setSize(145, 200)
      .setBarHeight(30)
      .setItemHeight(30)
      .addItems(l)
      .setFont(font2)
      .setColorForeground(Gui[0])
      .setColorBackground(Gui[3])
      .setColorActive(Gui[0])       // * * * * * * * * * * * * * * * * * * * * 
      .setType(ScrollableList.LIST) // * currently supported DROPDOWN and LIST
      .close()                      // * * * * * * * * * * * * * * * * * * * * 
      ;


    PImage[] pause = {loadImage("pp.png"), loadImage("p.png"), loadImage("pp.png")};
    //create pause botton
    cp5.addBang("Pause")
      //.setSize(100, 100)
      .setPosition(560+85-25, 100)
      .setColorForeground(Gui[0])
      .setColorBackground(Gui[3])
      .setColorActive(Gui[0])
      .setImages(pause)
      .updateSize()
      ;
    // * * * * * * * * * * * * * * * * * * * * 
    // * Set fast forward button
    // * * * * * * * * * * * * * * * * * * * * 
    PImage[] Skipf = {loadImage("sff.png"), loadImage("sf.png"), loadImage("sff.png")};
    cp5.addBang("Skipf")
      //.setSize(100, 100)
      .setPosition(560+85+50, 100)
      .setImages(Skipf)
      .updateSize()
      ;

    // * * * * * * * * * * * * * * * * * * * * 
    // * Set the reverse button
    // * * * * * * * * * * * * * * * * * * * * 
    PImage[] Skipb = {loadImage("sbb.png"), loadImage("sb.png"), loadImage("sbb.png")};
    cp5.addBang("Skipb")
      //.setSize(100, 100)
      .setPosition(560+85-100, 100)
      .setImages(Skipb)
      .updateSize()
      ;

    // * * * * * * * * * * * * * * * * * * * * 
    // * create tempo botton
    // * * * * * * * * * * * * * * * * * * * * 
    cp5.addKnob("Tempo")
      .setRange(30, 230)
      .setValue(100)
      .setPosition(560, 200)
      .setRadius(85)
      .setColorForeground(Gui[0])
      .setColorBackground(Gui[3])
      .setColorActive(Gui[0])
      .setDragDirection(Knob.HORIZONTAL)
      ;

    // * * * * * * * * * * * * * * * * * * * * 
    // * Set various voice synthesis buttons
    // * * * * * * * * * * * * * * * * * * * * 
    String []Pitch={"snareP", "kickP", "HiHatP"};
    for (int i=0; i<3; i++)
    {
      cp5.addKnob(Pitch[i])
        .setRange(0.5f, 2.0f)
        .setValue(1.f)
        .setPosition(865+i*165, 355)
        .setRadius(45)
        .setColorForeground(Gui[0])
        .setColorBackground(Gui[3])
        .setColorActive(Gui[0])
        .setDragDirection(Knob.HORIZONTAL)
        ;
    }

    // * * * * * * * * * * * * * * * * * * * * 
    // * Set various voice synthesis buttons
    // * * * * * * * * * * * * * * * * * * * * 
    String []Delay={"snareDelay", "kickDelay", "HiHatDelay"};
    for (int i=0; i<3; i++)
    {
      cp5.addKnob(Delay[i])
        .setRange(0.0001, 0.5)
        .setValue(0.0001)
        .setPosition(865+i*165, 355+120)
        .setRadius(45)
        .setColorForeground(Gui[0])
        .setColorBackground(Gui[3])
        .setColorActive(Gui[0])
        .setDragDirection(Knob.HORIZONTAL)
        ;
    }

    // * * * * * * * * * * * * * * * * * * * * 
    // * Set various voice synthesis buttons
    // * * * * * * * * * * * * * * * * * * * * 
    String []Gain={"snareGain", "kickGain", "HiHatGain"};
    for (int i=0; i<3; i++)
    {
      cp5.addKnob(Gain[i])
        .setRange(-15, 5)
        .setValue(0)
        .setPosition(865+i*165, 355+240)
        .setRadius(45)
        .setColorForeground(Gui[0])
        .setColorBackground(Gui[3])
        .setColorActive(Gui[0])
        .setDragDirection(Knob.HORIZONTAL)
        ;
    }

    //cp5.addSlider("EffectLevel")
    //  .setPosition(580, 470)
    //  .setSize(30, 275)
    //  .setValue(255)
    //  .setRange(0, 255)
    //  .setColorForeground(Gui[0])
    //  .setColorBackground(Gui[3])
    //  .setColorActive(Gui[0])
    //  ;
    // * * * * * * * * * * * * * * * * * * * *  
    // * Create volume buttons
    // * * * * * * * * * * * * * * * * * * * *  
    cp5.addSlider("Vol")
      .setPosition(680, 470)
      .setSize(30, 275)
      .setValue(0)
      .setRange(-15, 15)
      .setColorForeground(Gui[0])
      .setColorBackground(Gui[3])
      .setColorActive(Gui[0])
      ;

    //String []ins={"kick", "snare", "HiHat"};
    //for (int i=0; i<3; i++)
    //{
    //  cp5.addToggle(ins[i])
    //    .setPosition(865+i*150, 150)
    //    .setSize(120, 30)
    //    .setValue(true)
    //    .setMode(ControlP5.SWITCH)
    //    .setColorForeground(Gui[0])
    //    .setColorBackground(Gui[3])
    //    .setColorActive(Gui[1])
    //    ;
    //}

    // * * * * * * * * * * * * * * * * * * * *  
    // * set SINE Triangle SQUARE Voice synthesizers
    // * * * * * * * * * * * * * * * * * * * *  
    String []ins={"SINE", "Triangle", "SQUARE"};
    for (int i=0; i<3; i++)
    {
      cp5.addBang(ins[i])
        .setPosition(865+i*165, 710)
        .setSize(90, 20)
        .setColorForeground(Gui[0])
        .setColorBackground(Gui[3])
        .setColorActive(Gui[1])
        ;
    }
  }
  void UI()
  {
    // * * * * * * * * * * * * * * * * * * * *  
    // * Set the color of the sound synthesizer buttons, etc.
    // * * * * * * * * * * * * * * * * * * * *  
    String []ins={"SINE", "Triangle", "SQUARE"};
    String []Gain={"s", "k", "h"};
    fill(#333333);
    for (int i=0; i<3; i++)
    {

      // text(ins[i], 853+100+i*150, 93);
    }
    fill(Gui[0]);
    for (int i=0; i<3; i++)
    {
      text(Gain[i],829,100+i*50);
    }
  }
}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
// * Use the switch case function to control the effect of triggering the sound synthesizers
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
void controlEvent(ControlEvent theEvent) {
  switch(theEvent.getController().getName()) {
    case("Pause"):
    if (in.isPlaying())
    {
      in.pause();
    } else
    {
      in.loop();
    }
    break;
    case("Skipf"):
    println("skippppp");
    in.skip(1000);
    break;
    case("Skipb"):
    in.skip(-1000);
    break;
    case("Tempo"):
    bpm=int((theEvent.getController().getValue()));
    out.setTempo( bpm );
    break;
    case("snareGain"):
    snaregain.setValue(int((theEvent.getController().getValue())));
    break;
    case("kickGain"):
    kickgain.setValue(int((theEvent.getController().getValue())));
    break;
    case("HiHatGain"):
    hatgain.setValue(int((theEvent.getController().getValue())));
    break;
    case("snareDelay"):
    snareDelay.setDelTime((theEvent.getController().getValue()));
    break;
    case("kickDelay"):
    kickDelay.setDelTime((theEvent.getController().getValue()));
    break;
    case("HiHatDelay"):
    hatDelay.setDelTime((theEvent.getController().getValue()));
    break;
    case("snareP"):
    snarerateControl.value.setLastValue((theEvent.getController().getValue()));
    break;
    case("kickP"):
    kickrateControl.value.setLastValue((theEvent.getController().getValue()));
    break;
    case("HiHatP"):
    hatrateControl.value.setLastValue((theEvent.getController().getValue()));
    break;
    case("SINE"):
    OSCout.playNote(0, 2.6, myNote );
    break;
    case("Triangle"):
    OSCout.playNote(0, 2.6, myNote2 );
    break;
    case("SQUARE"):
    OSCout.playNote(0, 2.6, myNote3 );
    break;
    case("Vol"):
    in.setGain(int((theEvent.getController().getValue())));
    break;
    case("Music_List"):
    break;
  }
}

// * * * * * * * * * * * * * * * * * * * *  
// * Select the music to play in the playlist
// * * * * * * * * * * * * * * * * * * * *  
void Music_List(int n) {
  in.pause();
  CurrentName=MusicName[n];
  in=minim.loadFile(MusicName[n], 1024);
  meta = in.getMetaData();
  in.loop();
}

void kick(boolean theFlag) {
  kickLoud=theFlag;
}
void snare(boolean theFlag) {
  snareLoud=theFlag;
}
void HiHat(boolean theFlag) {
  hatLoud=theFlag;
}
