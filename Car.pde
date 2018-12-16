class Car extends Rectangle {
  float speed;
  Car(float x, float y, float w, float h, float speed){
    super(x,y,w,h);
    this.speed = speed;
  }
  void update(){
    if(speed > 0){ // need to check if it is completely off the screen for both of these
      if(x > width + w){
        x = 0 - w;
      }
    }
    else{
      if(x < -w){
        x = width + w;
      }
    }
    x += speed;
  }

}
