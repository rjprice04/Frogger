class Rectangle {
  float x;
  float y;
  float w;
  float h;
  PImage img;
  
  Rectangle(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h; 
    this.img = null;
  }
    Rectangle(float x, float y, float w, float h, PImage img){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h; 
    this.img = img;
  }
  void show(){
    if(img != null){
       //fill(200);
      //rect(x,y,w,h);
      image(img,x,y,w,h);
    }
    else{
      fill(200);
      rect(x,y,w,h);
    }
  }
  boolean interact(Frog frog){
     if(frog.x + frog.w > this.x    && frog.x  < this.x + this.w && frog.y == this .y ){
      return true;
    }
    
    return false;
  }

  
}
