class Frog extends Rectangle {
  boolean onLog;
    Frog(float x, float y, float w, float h){
    super(x,y,w,h);
    onLog = false;
  }
  void show(){
    fill(255);
    rect(x,y,w,h);
  }
  void moveUpDown(float move){
    float check  = y + move * 50;
    if(check < height && check > 0 ){
      y = check;
    }
   
  }
  void moveLeftRight(float move){
    float check  = x + move * 50;
    if(check < width+25  && check > -25 ){
      x = check;
    }
    
  }
    
  
  
}
