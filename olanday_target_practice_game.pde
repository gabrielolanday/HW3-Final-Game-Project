# HW3-Final-Game-Project

float x;
float y;

float score;
float miss;
float total;
float perc;

float targ;
float targdist;

int time;
int stopTime;
int restartTime;

boolean addOne;
boolean gamePlay = false;

void setup(){
  size(1280,720);
  frameRate(60);
  x = width/2;
  y = height/2;
  targ = 75;
  score = 0;
  miss = 0;
  total = 0;
  addOne = true;
  
}

void draw(){
  background(0);
  fill(255,0,0);
  ellipse(x,y,targ,targ);
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("PRESS ANY KEY TO START",width/2,(height/2)-100);
  textSize(12);
  text("Hint: You can also press any key at any time to reset.",width/2,(height/2)-80);
  if(gamePlay == true){
    time = millis();
    background(0);
    fill(255,0,0);
    ellipse(x,y,targ,targ);
    
    if(time - stopTime > 1000){
      x = random(80,1200);
      y = random(80,640);
      if (mousePressed == false){
        miss += 1;
      }
      total = score + miss;
      stopTime = millis();
    }
    targdist = dist(mouseX, mouseY, x, y);
    perc = (score/total) * 100;
    fill(255);
    textSize(12);
    text("SCORE  " + int(score),1180,20);
    text("MISS  " + int(miss), 1180,40);
    text("TOTAL  " + int(total),1180,60);
    text("ACCURACY",1180,80);
    text(String.format("%.2f",perc) + " %",1180,100);
    println(millis());
  }
  if(time - restartTime > 60000){
    gamePlay = false;
    background(0);
    fill(255);
    textSize(12);
    textSize(32);
    textAlign(CENTER);
    text("GAME OVER", width/2,height/2);
    text("PRESS ANY KEY TO TRY AGAIN", (width/2)-20,(height/2)+30);
    text("SCORE " + int(score), (width/2)-20,(height/2)+60);
    text("ACCURACY " + String.format("%.2f",perc) + " %",(width/2)-20,(height/2)+90);
   }
}

void mousePressed(){
  if (targdist <= targ/2){
    score += 1;
    stopTime = millis() - 1000;
    addOne = false;
  }
  else if(targdist > targ/2){
    if(addOne == true){
      miss += 1;;
      stopTime = millis() - 1000;
      addOne = false;
    }
  }

}
void mouseReleased(){
  addOne = true;
}

void keyPressed(){
  reset();
  stopTime = millis();
}

void reset(){
  background(0);
  fill(255);
  text("SCORE  " + int(score),1180,20);
  text("MISS  " + int(miss), 1180,40);
  text("TOTAL  " + int(total),1180,60);
  text("ACCURACY",1180,80);
  text(String.format("%.2f",perc) + "%",1180,100);
  
  x = width/2;
  y = height/2;
  targ = 75;
  score = 0;
  miss = 0;
  total = 0;
  addOne = true;
  
  gamePlay = true;
  restartTime = millis();
}
  
  
