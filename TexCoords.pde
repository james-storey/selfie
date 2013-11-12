
class TexCoords
{
  public int u;
  public int v;
 TexCoords(int x, int y)
 {
   u = x;
   v = y;
 }
 
 TexCoords copy()
 {
   return new TexCoords(u, v); 
 }
}
