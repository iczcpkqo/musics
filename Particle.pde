// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
// * Randomly draw the position and size of particles
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
class Particle
{
  float siz;
  float levelFac;
  PVector loc=new PVector();
  Particle(float x, float y)
  {
    loc.x=x;
    loc.y=y;
    siz=random(40, 70);
    levelFac=random(0,1);
  }
  void display()
  {
    strokeWeight(3);
    stroke(Gui[2],100);
    fill(Gui[0],150);
    ellipse(loc.x, loc.y, siz+MixLevel*levelFac, siz+MixLevel*levelFac);
  }
}
