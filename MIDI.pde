
class Tick implements Instrument
{
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
  // * Control the triggering of the three metronomes in the upper right corner
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
  void noteOn( float dur )
  {
    if ( hatRow[beat] )
    {

      hat.trigger();
    }
    if ( snrRow[beat] )
    {

      snare.trigger();
    }
    if ( kikRow[beat] ) {
      kick.trigger();
    }
  }

  void noteOff()
  {
    beat = (beat+1)%16;
    out.setTempo( bpm );
    out.playNote( 0, 0.25f, this );
  }
}
class Rect
{
  int x, y, w, h;
  boolean[] steps;
  int stepId;

  // * * * * * * * * * * * * * * * * * * * * 
  // * Draw the position of the metronome button
  // * * * * * * * * * * * * * * * * * * * * 
  public Rect(int _x, int _y, boolean[] _steps, int _id)
  {
    x = _x;
    y = _y;
    w = 12;
    h = MidiStep-8;
    steps = _steps;
    stepId = _id;
  }

  // * * * * * * * * * * * * * * * * * * * * 
  // * Draw the trace line of the metronome
  // * * * * * * * * * * * * * * * * * * * * 
  public void draw()
  {
    noStroke();
    fill(Gui[5]);
    ellipse(x, y, h, h);
    if ( steps[stepId] )
    {
      fill(Gui[0]);
      ellipse(x, y, w, w);
    } else
    {
    }
  }

  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
  // * Determine whether each point of the metronome is on
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
  public void mousePressed()
  {
    if ( mouseX >= x-h/2&& mouseX <= x+h/2 && mouseY >= y-h/2 && mouseY <= y+h/2 )
    {
      steps[stepId] = !steps[stepId];
    }
  }
}
