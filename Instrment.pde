// * * * * * * * * * * * * * * * * * * * *  
// * Control the play of tone
// * * * * * * * * * * * * * * * * * * * *  
class ToneInstrument implements Instrument
{
  Oscil sineOsc;
  AudioOutput out;
  ToneInstrument( float frequency, float amplitude, AudioOutput output )
  {
    out = output;
    sineOsc = new Oscil( frequency, amplitude, Waves.SINE );
  }
  void noteOn( float dur )
  {
    sineOsc.patch( out );
  }
  void noteOff()
  {
    sineOsc.unpatch( out );
  }
}

// * * * * * * * * * * * * * * * * * * * *  
// * Control the play of Triangle
// * * * * * * * * * * * * * * * * * * * *  
class TriangleInstrument implements Instrument
{
  Oscil TRIANGLEOsc;
  AudioOutput out;
  TriangleInstrument( String notes, float amplitude, AudioOutput output )
  {
    out = output;
    float frequency = Frequency.ofPitch( notes ).asHz();

    TRIANGLEOsc = new Oscil( frequency, amplitude, Waves.TRIANGLE);
  }
  void noteOn( float dur )
  {
    TRIANGLEOsc.patch( out );
  }
  void noteOff()
  {
    TRIANGLEOsc.unpatch( out );
  }
}

// * * * * * * * * * * * * * * * * * * * *  
// * Control the play of SQUARE
// * * * * * * * * * * * * * * * * * * * *  
class SQUAREInstrument implements Instrument
{
  Oscil SQUAREosc;
  AudioOutput out;
  SQUAREInstrument( String notes, float amplitude, AudioOutput output )
  {
    out = output;
    float frequency = Frequency.ofPitch( notes ).asHz();

    SQUAREosc = new Oscil( frequency, amplitude, Waves.SQUARE);
  }
  void noteOn( float dur )
  {
    SQUAREosc.patch( out );
  }
  void noteOff()
  {
    SQUAREosc.unpatch( out );
  }
}
