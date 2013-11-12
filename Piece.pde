
class Piece
{
  public PVector pos;
  public TexCoords tex;
  PImage img;
  int size;
  public boolean clicked;
  
  Piece(int x, int y, int u, int v, PImage i, int s)
  {
   pos = new PVector(x, y);
   tex = new TexCoords(u, v);
   img = i;
   size = s;
   clicked = false;
  } 
  
  void draw()
  {
    float z = 0.0f;
    if(clicked == true)
    {
      strokeWeight(2);
      stroke(255, 255, 50);
      z = 0.2f;
    }
    beginShape(QUADS);
    texture(img);
    vertex(pos.x, pos.y, z, tex.u, tex.v);
    vertex(pos.x + size, pos.y, z, tex.u + size, tex.v);
    vertex(pos.x + size, pos.y + size, z, tex.u + size, tex.v + size);
    vertex(pos.x, pos.y + size, z, tex.u, tex.v + size);
    endShape();
    strokeWeight(1);
    stroke(0);
  }
}
