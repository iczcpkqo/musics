// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
// * Set position of the displayed pictures on various frames
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
void setImage()
{
  pushMatrix();
  translate(0, 0);
  for (int i=0; i<5; i++)
  {
    image(De[i], 1337, 115+i*150);
  }
  popMatrix();

  pushMatrix();
  translate(0, 58);
  for (int i=0; i<2; i++)
  {
    image(sH[i], 561+i*100, 726);
  }
  popMatrix();

  image(dd[0], 1253, -25);
  image(dd[1], 36, 74);
  image(dd[2], 7, 44);

  image(dd[3], 1573, 5);
  image(dd[4], 1533, 5);
  image(dd[5], 642, 817);
  image(dd[6], 561, 843);
  image(dd[7], 357, 618);



  //image(dd[8], -288, -25);
  image(dd[9], 686, -2);
  image(dd[10], -26, 897);

 
  image(dd[13], 98, 816);
  image(dd[14], 138, 812);
  image(dd[15], 730, 487);

  image(dd[16], 730, 160);
  //image(dd[17], 506, 230);
  //image(dd[18], 357, 618);
  //image(dd[8], 336, 597);
  pushMatrix();
  translate(0, 0);
  for (int i=0; i<6; i++)
  {
    image(hx[i], 1129+i*-75, 907);
  }
  popMatrix();
}
