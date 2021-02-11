class Fr
{
  float xx=0;
  int h, m, s;
  float[] fftReal;
  int maxSpectrum = 80;
  int SRad = 240;
  int LRad = 200;
  FFT fft;
  Fr()
  {
    fft = new FFT(in.bufferSize(), in.sampleRate());
  }
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  // * Draw a short line enclosing a circle on the left control panel, use sin and cos functions, and change the length with the music
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  void drawFr(PVector location)
  {
    fft.forward(in.mix);
    fftReal = fft.getSpectrumReal();
    float ang=-PI/4;
    float angle=PI/40;
    int circThick = 5;
    for (int i = 0; i < maxSpectrum; i+=1) {
      float dist = fftReal[i];
      float dist2 = fftReal[i+1];
      stroke(Gui[1]);
      strokeWeight(8);
      line(location.x - cos(ang)*(SRad+dist+circThick),
        location.y + sin(ang)*(LRad+dist+circThick),
        location.x - cos(ang)*(SRad-dist-circThick),
        location.y + sin(ang)*(LRad-dist-circThick));
      ang+=angle;
    }
  }

  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  // * Draw two borders each in the upper left corner and the lower right corner of the control panel
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  void Drawjdt()
  {
    float posx = map(in.position(), 0, in.length(), 45+15, 340-15);
    stroke(Gui[1]);
    strokeWeight(5);
    line(45, 800, 340, 800);
    noStroke();
    
    
      fill(Gui[5]);
      ellipse(posx, 800, 30, 30);
    
  }
}
