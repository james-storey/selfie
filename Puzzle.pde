
class Puzzle
{
  Piece[][] pieces;
  PImage img;
  int xDim;
  int yDim;
  
  Piece clicked;
  
  Puzzle(PImage image)
  {
    xDim = int(width/100);
    yDim = int(height/100);
    pieces = new Piece[xDim][yDim];
    img = image;
    clicked = null;
  }
  
  void init()
  {
    int d = 100;
    for(int y = 0; y < yDim; y++)
    {
      for(int x = 0; x < xDim; x++)
      {
        pieces[x][y] = new Piece(x*d, y*d, x*d, y*d, img, d);
      }
    }
  }
  
  void swapRandom()
  {
    int x = int(random(0, xDim));
    int y = int(random(0, yDim));
    int dir = int(random(0, 4));
    
    if(dir == 0)
    {
      // up
      if(y-1 < 0)
        return;
      swap(pieces[x][y], pieces[x][y-1]);
    }
    else if(dir == 1)
    {
      // right
      if(x+1 >= xDim)
        return;
      swap(pieces[x][y], pieces[x+1][y]);
    }
    else if(dir == 2)
    {
      // down
      if(y+1 >= yDim)
        return;
      swap(pieces[x][y], pieces[x][y+1]);
    }
    else if(dir == 3)
    {
      // left
      if(x-1 < 0)
        return;
      swap(pieces[x][y], pieces[x-1][y]);
    }
  }
  
  void swap(Piece p, Piece q)
  { 
    TexCoords temp;
    temp = p.tex.copy();
    p.tex = q.tex.copy();
    q.tex = temp;
  }
  
  void click(int x, int y)
  {
    if( clicked == null)
    {
      pieces[floor(x/100)][floor(y/100)].clicked = true;
      clicked = pieces[floor(x/100)][floor(y/100)];
    }
    else 
    {
      swap(clicked,pieces[floor(x/100)][floor(y/100)]);
      clicked.clicked = false;
      clicked = null;
    }
  }
  
  void draw()
  {
    for(int y = 0; y < yDim; y++)
    {
      for(int x = 0; x < xDim; x++)
      {
        pieces[x][y].draw();
      }
    } 
  }
}
