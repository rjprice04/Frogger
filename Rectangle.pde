class Rectangle {
  float x;
  float y;
  float w;
  float h;
  
  Rectangle(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h; 
  }
  void show(){
    fill(200);
    rect(x,y,w,h);
  }

  
}
