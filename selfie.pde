/* @pjs preload="selfie.jpg"; 
 */

PImage selfie;
Puzzle p;
void setup()
{
  size(800, 800, P3D);
  selfie = loadImage("selfie.jpg");
  p = new Puzzle(selfie);
  textureMode(IMAGE);
  p.init();
}

void draw()
{
  background(200);
  p.draw();
  if(millis() > 2000 && millis() < 8000)
    p.swapRandom();
}

void mouseClicked()
{
 p.click(mouseX, mouseY); 
}
