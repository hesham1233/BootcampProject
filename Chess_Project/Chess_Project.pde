
boolean hell = false;
//neu(kopieren)
boolean hauptmenue = false;
boolean bewegung = false;
int klickY =0;
int klickX =0;
int selfigur =0;
enum Player {
  White, Black
};
  enum Type {
  Pawn, Knight, Bishop, Rook, Queen, King
};
 
PImage KingW, KingB, RookW, RookB, QueenW, QueenB, BishopW, BishopB, PawnW, PawnB, KnightW, KnightB;
 
Field field;
 
ChessMan selected;
 
void setup() {
  size(710, 910);
  background(#00E3FF);
  RookW = loadImage("Rook.png");
  RookB = loadImage("Rook1.png");
  KingW = loadImage("King.png");
  KingB = loadImage("King1.png");
  QueenW = loadImage("Queen.png");
  QueenB = loadImage("Queen1.png");
  BishopW = loadImage("Bishop.png");
  BishopB = loadImage("Bishop1.png");
  PawnW = loadImage("Pawn.png");
  PawnB = loadImage("Pawn1.png");
  KnightW = loadImage("Knight.png");
  KnightB = loadImage("Knight1.png");
 
  field = new Field();
  field.setup();
}
void draw() {
  field.draw();
 
  if (selected != null) {
   selected.drawAvailableMoves(); 
  }
 
  field.drawMen();
}
 
void mousePressed()
{
  int xm = (mouseX-35)/80;
  int ym = (mouseY-135)/80;
 
  if (selected == null) {
    selected = field.getAt(xm, ym);
  } else {
    field.move(selected, xm, ym);
    selected = null;
  }  
}


class ChessMan {
  Player player;
  Type type;
  int posX;
  int posY;
 
  ChessMan(Player player, Type type) {
    this.player = player;
    this.type = type;
  }  
 
  void setPosition(int x, int y) {
    this.posX = x;
    this.posY = y;
  }
 
  int[] getMoves(Field field) {
    int[] arr = new int[0];
    return arr;
  }
 
 
  PImage getImage() {
    return null;
  }
 
  void draw() {
    if (getImage() != null) {
      image(getImage(), 40+80*posX, 135+80*posY, width/10, height/12);
    }
  }
 
  void drawAvailableMoves(){
 
  }
};
 
class Rook extends ChessMan {
  Rook(Player player) {
    super(player, Type.Rook);
  }
  PImage getImage() {
    if (player == Player.White) {
      return RookW;
    } else {
      return RookB;
    }
  }
 
  void drawAvailableMoves(){
    fill(240);
 
   
    for(int x = posX+1; x < 8; x++) {
      ChessMan at = field.getAt(x, posY);
 
      if (at == null) {
        rect(35+80*x, 135+80*posY, 80, 80);
      } else if (at.player != player) {
        rect(35+80*x, 135+80*posY, 80, 80);
        break;
      } else {
        break;
      }
    }
    for(int x = posX-1; x >= 0; x--) {
      ChessMan at = field.getAt(x, posY);
      if (at == null) {
        rect(35+80*x, 135+80*posY, 80, 80);
      } else if (at.player != player) {
        rect(35+80*x, 135+80*posY, 80, 80);
        break;
      } else {
        break;
      }
    }
 

    for(int y = posY+1; y < 8; y++) {
      ChessMan at = field.getAt(posX, y);
 
      if (at == null) {
        rect(35+80*posX, 135+80*y, 80, 80);
      } else if (at.player != player) {
        rect(35+80*posX, 135+80*y, 80, 80);
        break;
      } else {
        break;
      }
    }
    for(int y = posY-1; y >= 0; y--) {
      ChessMan at = field.getAt(posX, y);
      if (at == null) {
        rect(35+80*posX, 135+80*y, 80, 80);
      } else if (at.player != player) {
        rect(35+80*posX, 135+80*y, 80, 80);
        break;
      } else {
        break;
      }
    }    
  }
};
 
class Knight extends ChessMan {
  Knight(Player player) {
    super(player, Type.Knight);
  }
  PImage getImage() {
    if (player == Player.White) {
      return KnightW;
    } else {
      return KnightB;
    }
  }
};
 
class King extends ChessMan {
  King(Player player) {
    super(player, Type.King);
  }
 
  PImage getImage() {
    if (player == Player.White) {
      return KingW;
    } else {
      return KingB;
    }
  }
};
 
class Queen extends ChessMan {
  Queen(Player player) {
    super(player, Type.Queen);
  }
 
  PImage getImage() {
    if (player == Player.White) {
      return QueenW;
    } else {
      return QueenB;
    }
  }
};
 
class Bishop extends ChessMan {
  Bishop(Player player) {
    super(player, Type.Bishop);
  }
 
  PImage getImage() {
    if (player == Player.White) {
      return BishopW;
    } else {
      return BishopB;
    }
  }
    void drawAvailableMoves(){
    fill(240);
 
  
    for(int x = posX+1  ; x < 8 ; x++ ) {
 
      ChessMan at = field.getAt(x, posY+x-posX);
 
      if (at == null) {
        rect(35+80*x, 135+80*(posY+x-posX), 80, 80);
      } else if (at.player != player) {
        rect(35+80*x, 135+80*(posY+x-posX), 80, 80);
        break;
      } else {
        break;
      }
    }
   for(int x = posX+1  ; x < 8 ; x++ ) {
      ChessMan at = field.getAt(x, posY-x+posY);
      if (at == null) {
        rect(35+80*x, 135+80*(posY-x+posX), 80, 80);
      } else if (at.player != player) {
        rect(35+80*x, 135+80*(posY-x+posX), 80, 80);
        break;
      } else {
        break;
      }
    }
   for(int x = posX-1  ; x >= 0 ; x-- ) {

      ChessMan at = field.getAt(x, posY+x-posX);
 
      if (at == null) {
        rect(35+80*x, 135+80*(posY+x-posX), 80, 80);
      } else if (at.player != player) {
        rect(35+80*x, 135+80*(posY+x-posX), 80, 80);
        break;
      } else {
        break;
      }
    }
    for(int x = posX-1  ; x >= 0 ; x-- ) {
      ChessMan at = field.getAt(x, posY-x+posX);
      if (at == null) {
        rect(35+80*x, 135+80*(posY-x+posX), 80, 80);
      } else if (at.player != player) {
        rect(35+80*x, 135+80*(posY-x+posX), 80, 80);
        break;
      } else {
        break;
      }
    }
 
  }
};
 
class Pawn extends ChessMan {
  Pawn(Player player) {
    super(player, Type.Pawn);
  }
 
  PImage getImage() {
    if (player == Player.White) {
      return PawnW;
    } else {
      return PawnB;
    }
  }
};


class Field {
 
  ChessMan positions[][];
 
  Field() {
    positions = new ChessMan[8][8];
  }
 
  void setup() {
    positions[0][0]= new Rook(Player.Black);
    positions[1][0]= new Knight(Player.Black);
    positions[2][0]= new Bishop(Player.Black);
    positions[3][0]= new King(Player.Black);
    positions[4][0]= new Queen(Player.Black);
    positions[5][0]= new Bishop(Player.Black);
    positions[6][0]= new Knight(Player.Black);
    positions[7][0]= new Rook(Player.Black);
    positions[0][1]= new Pawn(Player.Black);
    positions[1][1]= new Pawn(Player.Black);
    positions[2][1]= new Pawn(Player.Black);
    positions[3][1]= new Pawn(Player.Black);
    positions[4][1]= new Pawn(Player.Black);
    positions[5][1]= new Pawn(Player.Black);
    positions[6][1]= new Pawn(Player.Black);
    positions[7][1]= new Pawn(Player.Black);
    //ab hier schwarz
    positions[0][6]= new Pawn(Player.White);
    positions[1][6]= new Pawn(Player.White);
    positions[2][6]= new Pawn(Player.White);
    positions[3][6]= new Pawn(Player.White);
    positions[4][6]= new Pawn(Player.White);
    positions[5][6]= new Pawn(Player.White);
    positions[6][6]= new Pawn(Player.White);
    positions[7][6]= new Pawn(Player.White);
    positions[0][7]= new Rook(Player.White);
    positions[1][7]= new Knight(Player.White);
    positions[2][7]= new Bishop(Player.White);
    positions[3][7]= new King(Player.White);
    positions[4][7]= new Queen(Player.White);
    positions[5][7]= new Bishop(Player.White);
    positions[6][7]= new Knight(Player.White);
    positions[7][7]= new Rook(Player.White);
 
    for (int x = 0; x < 8; x++) {
      for (int y = 0; y < 8; y++) {
        if (positions[x][y] != null) {
          positions[x][y].setPosition(x, y);
        }
      }
    }
  }
 
 
  void draw() {
    background(#00E3FF);
    //Malen des Rands
    fill(#FF0505);
    rect(20, 120, 670, 670);
    fill(240, 201, 104);
    rect(25, 125, 660, 660);
    fill(152, 100, 69);
    rect(30, 130, 650, 650);
 
    for (int x = 0; x < 8; x++) {
      for (int y = 0; y < 8; y++) {
        if (hell == true) {
          fill(240, 201, 104);
          hell = false;
        } else {
          fill(152, 100, 69);
          hell = true;
        }
        rect(35+80*x, 135+80*y, 80, 80);
      }
      if (hell == true) {
        hell = false;
      } else {
        hell = true;
      }
    }
  }
 
 
  void drawMen() {
     for (int x = 0; x < 8; x++) {
      for (int y = 0; y < 8; y++) {        
        if (positions[x][y] != null) {
          positions[x][y].draw();
        }
      }
     }
  }
  ChessMan getAt(int x, int y) {
   if (x >= 0 && x < 8 && y >= 0 && y < 8) {
     return positions[x][y];
   }
   return null;
  }
 
  void move(ChessMan man, int x, int y) {
      positions[man.posX][man.posY] = null;
     positions[x][y] = man;
     man.setPosition(x, y);
  }
}
