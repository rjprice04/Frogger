class Car extends Rectangle {
  float speed;
  Car(float x, float y, float w, float h, float speed){
    super(x,y,w,h);
    this.speed = speed;
  }
  void update(){
    if(speed > 0){ // need to check if it is completely off the screen for both of these
      if(x > width){
        x = -50;
      }
    }
    else{
      if(x < 0){
        x = width + 50;
      }
    }
    x += speed;
  }
  boolean intersect(Frog frog){
    
    if(frog.x > x && frog.x  < this.x + this.w && frog.y == this .y){
      return true;
    }
    else{
      return false;
    }
  
  }
}
