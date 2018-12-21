Frog frog;
Car[] cars;
Log[] logs;
float GRID = 50;
int WIDTH = 500;
int HEIGHT = 500;
int lives;
PImage carImg;
PImage carImgRe;
PImage logImg;
PImage waterImg;
PImage grassImg;
PImage frogImg;

void setup(){
  frogImg = loadImage("frogImg.png");
  waterImg = loadImage("waterImg.png");
  carImg = loadImage("carImg.png");
  carImgRe = loadImage("carImg2.png");
  logImg = loadImage("logImg.png");
  grassImg = loadImage("grassImg.jpg");
  resetGame();
  size(500,500);
  lives = 3;
  cars = new Car[8];
  int index = 0;
  //cars 
  for(int i = 0; i < 2; i++){
    float x = i *300;
    cars[index] = new Car(x, height-GRID*2, GRID*2 , GRID, 2.0, carImg); 
    index++;
  }
  for(int i = 0; i< 2; i++){
    float x = i * 200 + 150;
    cars[index] = new Car(x, height-GRID*3, GRID*1.5, GRID, -3.5,carImgRe); 
    index++;
  }
  for(int i = 0; i< 4; i++){
     float x = i *150 +25;
     cars[index] = new Car(x, height-GRID*4, GRID* 1.5 , GRID, 1,carImg); 
     index++;
  }
  //logs
   logs = new Log[7];
   index = 0;
    for(int i = 0; i< 3; i++){
      float x = i * 250 + 100;
      logs[index] = new Log(x, height-GRID*6, GRID*2, GRID, 1,logImg); 
      index++;
    }
    for(int i = 0; i< 2; i++){
      float x = i * 200 + 30;
      logs[index] = new Log(x, height-GRID*7, GRID*3, GRID, -2,logImg ); 
      index++;
    }
    for(int i = 0; i< 2; i++){
      float x = i * 400 + 10;
      logs[index] = new Log(x, height-GRID*8, GRID*2.25, GRID , 1.5,logImg ); 
      index++;
    }
     
  
  
}

void draw(){
  background(#303030);
  image(grassImg,0,0, width, GRID * 2);
  //rect(0,0, width, GRID *2);
  image(grassImg, 0, height-GRID, width, GRID);
  //rect(0,height-GRID, width, GRID);
  image(grassImg, 0, height - GRID * 5, width, GRID);
  //rect(0, height - GRID * 5, width, GRID);
  image(waterImg, 0, height-GRID*8, width, GRID*3);
   for(Car car : cars){
    if(car.interact(frog)){
      lives--;
      resetGame();
    }
    car.update();
    car.show();
  }
  for(Log log : logs){
    if(frog.y < GRID * 5 && frog.y > GRID  ){
      if(log.interact(frog)){
        frog.setOnLog(true, log.speed);
      }
               

      if(!frog.onLog ){
        lives--;
        resetGame();
      }
    }

    log.update();
    log.show();
  }
  
  if(frog.onLog && frog.y == GRID * 5 || frog.y == GRID ){     frog.setOnLog(false,0);
  }
  int spot = 20;
  textSize(20);
  fill(0);
  text("Lives",spot-5,height-(GRID/2+9));
  for(int i = 0; i< lives; i++){
    
    fill(255,0,0);
    ellipse(spot, height-GRID/2, 15,15);
    spot+=17;
  }
  
    frog.update();
    frog.show(); 
    if(lives <= 0){
      textSize(45);
      textAlign(CENTER);
      fill(255,0,0);
      String s = "Game Over \n\n Click to play again";
      text(s,250,245);
    }
}

void keyPressed(){
  //System.out.println(keyCode);
  if(lives > 0){
    if(keyCode == 38){
      frog.moveUpDown(-1);
      //frog.move(0,-1);
      
    }
    else if(keyCode == 40){
      frog.moveUpDown(1);

      //frog.move(0,1);
    }
    else if(keyCode == 37){
      frog.moveLeftRight(-1);
      //frog.move(-1,0);
    }
    else if(keyCode == 39){
      frog.moveLeftRight(1);

      //frog.move(1,0);
    }
  }
  
}
void mousePressed(){
  if(lives <= 0){
    lives = 3;
  }
}

void resetGame(){
  frog = new Frog((WIDTH/2) - 25, HEIGHT-50, GRID/2,GRID, frogImg);
}
