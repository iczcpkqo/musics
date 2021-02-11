// * * * * * * * * * * * * * * * * * * * *  
// * Line drawing class
// * * * * * * * * * * * * * * * * * * * *  
class Line
{
  PVector[]Rvertices;
  PVector[]Lvertices;
  PVector[]LOutvertices;
  PVector[]ROutvertices;

  float Ly=150;
  float Ry=700;

  float Routy=300;
  float Louty=330;
  Line()
  {
    Rvertices=new PVector[1024];
    Lvertices=new PVector[1024];


    LOutvertices=new PVector[1024];
    ROutvertices=new PVector[1024];



    for (int i=0; i<LOutvertices.length; i++) {
      LOutvertices[i]=new PVector(map(i, 0, LOutvertices.length, 865, 1285 ), Routy);
    }

    for (int i=0; i<ROutvertices.length; i++) {
      ROutvertices[i]=new PVector(map(i, 0, ROutvertices.length, 865, 1285), Louty);
    }


    for (int i=0; i<Rvertices.length; i++) {
      Rvertices[i]=new PVector(map(i, 0, Rvertices.length, 45, 500), Ly);
    }

    for (int i=0; i<Lvertices.length; i++) {
      Lvertices[i]=new PVector(map(i, 0, Lvertices.length, 45, 500), Ry);
    }
  }

  void updateRightVertices() {
    for (int i=0; i<Rvertices.length; i++) {
      Rvertices[i].y+=( Ry+in.left.get(i)*100-Rvertices[i].y)*0.6;
    }
  }

  void updateLeftVertices() {
    for (int i=0; i<Lvertices.length; i++) {
      Lvertices[i].y+=( Ly+in.left.get(i)*100-Lvertices[i].y)*0.6;
    }
  }

  void updateRightoutVertices() {
    for (int i=0; i<Rvertices.length; i++) {
      ROutvertices[i].y+=( Routy+out.right.get(i)*30-ROutvertices[i].y)*0.6;
    }
  }

  void updateLeftoutVertices() {
    for (int i=0; i<Lvertices.length; i++) {
      LOutvertices[i].y+=( Louty+out.left.get(i)*30-LOutvertices[i].y)*0.6;
    }
  }

  void drawLine()
  {
    pushStyle();
    stroke(Gui[1]);
    strokeWeight(2);
    noFill();
    beginShape();
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    // * draw the line of the upper side of the left control panel 
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    for (int i=0; i<in.bufferSize()-1; i+=10) {
      vertex(Rvertices[i].x, Rvertices[i].y);
    }
    endShape();
    beginShape();
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    // * draw the line of the lower side of the left control panel 
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    for (int i=0; i<in.bufferSize()-1; i+=10) {
      vertex(Lvertices[i].x, Lvertices[i].y);
    }
    endShape();


    beginShape();
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    // * draw the line of the upper side of the left control panel 
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    for (int i=0; i<in.bufferSize()-1; i+=10) {
      vertex(Rvertices[i].x, Rvertices[i].y-20);
    }
    endShape();

    beginShape();
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    // * draw the line of the lower side of the left control panel 
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    for (int i=0; i<in.bufferSize()-1; i+=10) {
      vertex(Lvertices[i].x, Lvertices[i].y-20);
    }
    endShape();

    noStroke();
    fill(Gui[5], 120);
    rect(865, 245, 420, 100);

    stroke(Gui[1]);
    beginShape();
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    // * draw the line of the upper side of the top right panel 
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    for (int i=0; i<out.bufferSize()-1; i+=10) {
      vertex(ROutvertices[i].x, ROutvertices[i].y-20);
    }
    endShape();

    beginShape();
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    // * draw the line of the lower side of the top right panel 
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    for (int i=0; i<out.bufferSize()-1; i+=10) {
      vertex(LOutvertices[i].x, LOutvertices[i].y-20);
    }
    endShape();

    noStroke();
    fill(Gui[5], 120);
    rect(865, 750, 420, 100);

    stroke(Gui[1]);
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    // * draw the line of the lower side of Voice synthesizer which the panel on the bottom right
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    for ( int i = 0; i < OSCout.bufferSize() - 1; i++ )
    {
      // * * * * * * * * * * * * * * * * * * * * 
      // * find the x position of each buffer value
      // * * * * * * * * * * * * * * * * * * * * 
      float x1  =  map( i, 0, OSCout.bufferSize(), 865, 1285 );
      float x2  =  map( i+1, 0, OSCout.bufferSize(), 865, 1285);
      line( x1, 800 - OSCout.mix.get(i)*50, x2, 800 - OSCout.mix.get(i+1)*50);
    }
  }
  void  run()
  {
    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    // * Control the _upper_ line of the control panel on the left to change with the change of music playback
    // *
    updateRightVertices();

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    // * Control the _lower_ line of the control panel on the left to change with the change of music playback
    // * 
    updateLeftVertices();

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    // * Control the _first_ line of the upper right panel to change with the metronome
    // * 
    updateLeftoutVertices();

    // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
    // * Control the _second_ line of the upper right panel to change with the metronome
    // * 
    updateRightoutVertices();
    drawLine();
  }
}
