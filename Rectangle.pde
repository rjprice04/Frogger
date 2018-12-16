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
  boolean interact(Frog frog){
     if(frog.x > this.x - this.w/4 && frog.x  < this.x + this.w && frog.y == this .y){
      return true;
    }
    
    return false;
  }

  
}
