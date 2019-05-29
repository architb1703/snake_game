int[] turn_box_x= new int[100];
int[] turn_box_y=new int[100];
int[] snake_box_x= new int[100];
int[] snake_box_y=new int[100];
int apple_x,apple_y;
int speed=50;
int[]  dir=new int[50];
String[] dir_box;
int i,j,count,score,k,m;
String s="GAME OVER";
PImage img;

void setup(){
  size(500,500);
  background(255,255,255);
  score=0;
  snake_box_x[0]=40;
  snake_box_y[0]=40;
  apple_x=(int)random(0,499);
  apple_x=apple_x-(apple_x%10);
  apple_y=(int)random(0,499);
  apple_y=apple_y-(apple_y%10);
  frameRate(speed);
  dir[0]=2;
  img=loadImage("grass.png");
}

void draw(){
  //image(img,0,0,500,500);
  background(255,255,255);
  //for (j=10;j<500;j+=10){
  //  line(j,0,j,500);
  //}
  //for (j=10;j<500;j+=10){
  //  line(0,j,500,j);
  //}
  fill(255,0,0);
  rect(apple_x-(apple_x%10),apple_y-(apple_y%10),10,10);
  
  text(score,10,10);
  
  fill(0,250,150);
  for(k=0;k<score+1;k++){
  rect(snake_box_x[k],snake_box_y[k],10,10);
  }
  
  
  if((count%5)==0){
  //println(dir[0]); 
    if (dir[0]==2){
      snake_box_x[0]+=10;
      
    }
    
    if (dir[0]==3){
      snake_box_y[0]+=10;
    }
    
    if (dir[0]==4){
      snake_box_x[0]-=10;
    }
    
    if (dir[0]==1){
      snake_box_y[0]-=10;
    }
    
   if (snake_box_x[0]<0 || snake_box_x[0]>=500 || snake_box_y[0]<0 || snake_box_y[0]>=500){
   background(255,255,255);
   fill(0,0,0);
   textSize(40);
   text("GAME OVER",150,150);
   text(score,230,200);
    noLoop();
   }
    
    for(m=1;m<score;m++){
      if (snake_box_x[0]==snake_box_x[m] && snake_box_y[0]==snake_box_y[m]){
      background(255,255,255);
   fill(0,0,0);
   textSize(40);
   text("GAME OVER",150,150);
   text(score,230,200);
    noLoop();}}
    
    for (k=1;k<(score+1);k++){ 
    
    if (dir[k]==2){
      snake_box_x[k]+=10;
      
    }
     else if(dir[k]==3){
      snake_box_y[k]+=10;
 
    }
    else if(dir[k]==4){
      snake_box_x[k]-=10;
      }
    else if(dir[k]==1){
      snake_box_y[k]-=10;
      }}
    
    for(k=score;k>0;k--){
           if (turn_box_x[k-1]==snake_box_x[k]&&turn_box_y[k-1]==snake_box_y[k]){
       turn_box_x[k]=turn_box_x[k-1];
       turn_box_y[k]=turn_box_y[k-1];
       dir[k]=dir[k-1];}
    }
    if (snake_box_x[0]==(apple_x-(apple_x%10)) && (apple_y-(apple_y%10))==snake_box_y[0]){
    apple_x=(int)random(0,499); 
    apple_y=(int)random(0,499);
    
    score++;
    
    if (dir[score-1]==2){
      snake_box_x[score]=snake_box_x[score-1]-10;
      snake_box_y[score]=snake_box_y[score-1];
      
      dir[score]=dir[score-1];
      turn_box_x[score]=turn_box_x[score-1];
      turn_box_y[score]=turn_box_y[score-1];
    }
     else if(dir[score-1]==3){
      snake_box_y[score]=snake_box_y[score-1]-10;
      snake_box_x[score]=snake_box_x[score-1];
      dir[score]=dir[score-1];
      turn_box_x[score]=turn_box_x[score-1];
      turn_box_y[score]=turn_box_y[score-1];
    }
    else if(dir[score-1]==4){
      snake_box_x[score]=snake_box_x[score-1]+10;
      snake_box_y[score]=snake_box_y[score-1];
      dir[score]=dir[score-1];
      turn_box_x[score]=turn_box_x[score-1];
      turn_box_y[score]=turn_box_y[score-1];
  }
    else if(dir[score-1]==1){
      snake_box_y[score]=snake_box_y[score-1]+10;
      snake_box_x[score]=snake_box_x[score-1];
      dir[score]=dir[score-1];
      turn_box_x[score]=turn_box_x[score-1];
      turn_box_y[score]=turn_box_y[score-1];
    }
    
    }
  }
  
  count++;
  //println(count);
  println(turn_box_x[1],snake_box_x[2]);
} 

void keyPressed(){
  if (key=='w'){
    dir[0]=1;
    turn_box_x[0]=snake_box_x[0];
    turn_box_y[0]=snake_box_y[0];
  }
  else if(key=='d'){
    dir[0]=2;
    turn_box_x[0]=snake_box_x[0];
    turn_box_y[0]=snake_box_y[0];
  }
  else if(key=='s'){
    dir[0]=3;
    turn_box_x[0]=snake_box_x[0];
    turn_box_y[0]=snake_box_y[0];
  }
  else if(key=='a'){
    dir[0]=4;
    turn_box_x[0]=snake_box_x[0];
    turn_box_y[0]=snake_box_y[0];
  }
}
