class Frog extends Rectangle {
  boolean onLog;
  float speed;
    Frog(float x, float y, float w, float h){
    super(x,y,w,h);
    onLog = false;
    speed = 0;
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
  //void move(float xMove, float yMove){
  //  float checkX = x + xMove * 25;
  //  float checkY = y + yMove * 25;
  //  if(checkX < width  && checkX > -25 && checkY < height + 25 && checkY > 0){
  //    this.x = checkX;
  //    this.y = checkY;
  //  }
    
  //}
  void moveLeftRight(float move){
    float check  = x + move * 25;
    if(check < width+25  && check > 0 ){
      x = check;
    }
    
  }
  void setOnLog(boolean onLog, float speed){
    this.onLog = onLog;
    this.speed = speed;
  }
  void update(){
    this.x += speed;
  }

  
  
}
