Frog frog;
Car[] cars;
Log[] logs;
float GRID = 50;
int WIDTH = 500;
int HEIGHT = 500;
void setup(){
  resetGame();
  size(500,500);
  
  cars = new Car[8];
  int index = 0;
  //cars 
  for(int i = 0; i < 2; i++){
    float x = i *300;
    cars[index] = new Car(x, height-GRID*2, GRID*2 , GRID, 2.0); 
    index++;
  }
  for(int i = 0; i< 2; i++){
    float x = i * 200 + 150;
    cars[index] = new Car(x, height-GRID*3, GRID*1.5, GRID, -3.5); 
    index++;
  }
  for(int i = 0; i< 4; i++){
     float x = i *150 +25;
     cars[index] = new Car(x, height-GRID*4, GRID , GRID, 1); 
     index++;
  }
  //logs
   logs = new Log[7];
   index = 0;
    for(int i = 0; i< 3; i++){
      float x = i * 250 + 100;
      logs[index] = new Log(x, height-GRID*6, GRID*1.75, GRID, 1 ); 
      index++;
    }
    for(int i = 0; i< 2; i++){
      float x = i * 200 + 30;
      logs[index] = new Log(x, height-GRID*7, GRID*3, GRID, -2 ); 
      index++;
    }
    for(int i = 0; i< 2; i++){
      float x = i * 400 + 10;
      logs[index] = new Log(x, height-GRID*8, GRID*2.25, GRID , -1.5 ); 
      index++;
    }
     
  
  
}

void draw(){
  //System.out.println(mouseY);
  background(0);
  rect(0,0, width, GRID *2);
  rect(0,height-GRID, width, GRID);
  rect(0, height - GRID * 5, width, GRID);

   for(Car car : cars){
    if(car.interact(frog)){
      resetGame();
    }
    car.update();
    car.show();
  }
  for(Log log : logs){
    System.out.println(frog.y);
    if(frog.y < GRID * 5 && frog.y > GRID * 2 ){
      if(log.interact(frog)){
        frog.setOnLog(true,log.speed);
      }
      if(!frog.onLog ){
        resetGame();
      }
    }

    log.update();
    log.show();
  }
  
  if(frog.onLog && frog.y == GRID * 5 || frog.y == GRID ){     frog.setOnLog(false,0);
  }
  frog.update();
  frog.show(); 
}

void keyPressed(){
  if(keyCode == 38){
    frog.moveUpDown(-1);
  }
  else if(keyCode == 40){
    frog.moveUpDown(1);
  }
  else if(keyCode == 37){
    frog.moveLeftRight(-1);
  }
  else if(keyCode == 39){
    frog.moveLeftRight(1);
  }
  
}

void resetGame(){
  frog = new Frog((WIDTH/2) - 25, HEIGHT-50, GRID/2,GRID/2);
}
