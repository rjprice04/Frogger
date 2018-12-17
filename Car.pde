class Car extends Rectangle {
  float speed;
  PImage img;
  Car(float x, float y, float w, float h, float speed, PImage carImg){
    super(x,y,w,h, carImg);
    //img = carImg;
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
