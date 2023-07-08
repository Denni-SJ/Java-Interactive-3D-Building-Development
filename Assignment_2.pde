import peasy.*;
import processing.sound.*;
int buildingSize = 10;
int buildingLevel = 0;
int time;
int volume;
PeasyCam cam;

Table backgroundColor;
Table myTable;

SoundFile music1;
SoundFile music2;
SoundFile music3;
SoundFile music4;
SoundFile music5;


void setup() {
  
  
  //load tables
  //Wes
  myTable= loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2022-08-01T16%3A54%3A34.924&rToDate=2022-08-30T16%3A54%3A34.924&rFamily=weather&rSensor=SR", "csv");
  backgroundColor = loadTable("https://eif-research.feit.uts.edu.au/api/csv/?rFromDate=2022-08-01T16%3A54%3A34.924&rToDate=2022-08-30T16%3A54%3A34.924&rFamily=weather&rSensor=SR", "csv");

  //load sound files
  music1 = new SoundFile(this, "one.mp3");
  music2 = new SoundFile(this, "two.mp3");
  music3 = new SoundFile(this, "three.mp3");
  music4 = new SoundFile(this, "five.mp3");
  music5 = new SoundFile(this, "six.mp3");
  
  size(1200,800,P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(700);
  cam.setYawRotationMode();
}
int clock=0;
int index = 0;
void draw() {
  rotateX(radians(0));
  rotateY(radians(0));
  frameRate(30);

  // for (index=0; index < backgroundColor.getRowCount(); index++) {
  clock++;
  if (clock%3==0)
    index++;
  if (index>backgroundColor.getRowCount()-1)
    index=0;
  int y = backgroundColor.getInt(index, 1);
  println(y);
  background(y+100, y+100, y+100);
  if(key == 'B' || key == 'b'){
    background(y+15, y+15, y+80);
  }
  if(key == 'G' || key == 'g'){
    background(y+15, y+80, y+15);
  }
  else if(key == 'R' || key == 'r'){
    background(y+80, y+15, y+15);
  }
  // Building main body;
  fill(237,224,179);
  box(40 * buildingSize, buildingSize, 20 * buildingSize);
  
  pushMatrix();
  for (buildingLevel = 0; buildingLevel < 7; buildingLevel++) {
  translate(0, buildingSize,0);
  fill(237,224,179);
  box(40 * buildingSize, buildingSize, 20 * buildingSize);
  }
  popMatrix();
  
  pushMatrix();
  for (buildingLevel = 0; buildingLevel < 7; buildingLevel++) {
  translate(0, -1 * buildingSize,0);
  fill(237,224,179);
  box(40 * buildingSize, buildingSize, 20 * buildingSize);
  }
  popMatrix();
  
  //door 1
  pushMatrix();
  
  translate(0, -1 * buildingSize,0);
  fill(0,95);
  beginShape();
  vertex(202,75,-85);  // left top corner
  vertex(202,75,-95);  // right top corner
  vertex(202,100,-95);  // right bottom corner
  vertex(202,100,-85);  // left bottom corner
  endShape(CLOSE);
  popMatrix();
  
  
  //door 2
  pushMatrix();
  translate(0, -1 * buildingSize,0);
  fill(0,95);
  beginShape();
  vertex(180,75,102);  // left top corner
  vertex(190,75,102);  // right top corner
  vertex(190,100,102);  // right bottom corner
  vertex(180,100,102);  // left bottom corner
  endShape(CLOSE);
  popMatrix();
  
  //door 3
  pushMatrix();
  translate(0, -1*buildingSize,0);
  fill(0,95);
  beginShape();
  vertex(-202,75,85);  // left top corner
  vertex(-202,75,95);  // right top corner
  vertex(-202,100,95);  // right bottom corner
  vertex(-202,100,85);  // left bottom corner
  endShape(CLOSE);  
  popMatrix();
  
  // back cover
  pushMatrix();
  translate(0, -2 * buildingSize,0);
  color c = color (21, 37, 17, 150);
  fill(c);
  beginShape();
  vertex(-210,-80,-100);//left-top point
  vertex(-200,100,-110);//left-bottom point
  vertex(200,100,-110);//right-bottom point
  vertex(200,-100,-100);//right-top point
  endShape(CLOSE);
  popMatrix();
  
  // front cover
  pushMatrix();
  translate(0, -2 * buildingSize,0);
  beginShape();
  vertex(-200,-70,100);//left-top point
  vertex(-190,100,110);//left-bottom point
  vertex(80,100,110);//bottom middle point
  vertex(190,75,110);//right-bottom point
  vertex(210,-100,100);//right-top point
  endShape(CLOSE);
  popMatrix();
  
  // left cover
  pushMatrix();
  translate(0, -2 * buildingSize,0);
  beginShape();
  vertex(-200,-90,110);// left view right-top
  vertex(-200,-80,-100);// left view left-top
  vertex(-210,100,-100);// left view left-bottom
  vertex(-210,100,10);// left view bottom middle
  vertex(-210,75,100);// left view right-bottom
  endShape(CLOSE);
  popMatrix();
  
  // right cover
  pushMatrix();
  translate(0, -2 * buildingSize,0);
  beginShape();
  vertex(200,-90,100);// right view left-top
  vertex(200,-100,-100);// right view right-top
  vertex(210,75,-100);// right view right-bottom
  vertex(210,100,-10);// right view bottom middle
  vertex(210,100,90);// right view left-bottom
  endShape(CLOSE);
  popMatrix();
  
  //building Bottom
  pushMatrix();
  fill(200);
  translate(0, 8 * buildingSize,0);
  box(50 * buildingSize, 0.1 * buildingSize, 30 * buildingSize);
  popMatrix();
  
  // UTS LOGOs
  // Front Logo
  pushMatrix();
  fill(225);
  textSize(30);
  text("UTS",130, -80, 105);
  popMatrix();
  // Left logo
  pushMatrix();
  fill(225);
  textSize(30);
  rotateY(radians(-90));
  text("UTS",40, -80, 203);
  popMatrix();  
  
}
void keyReleased(){
   if (key == 'U' || key == 'u'){
    music1.play();
    music2.stop();
    music3.stop();
    music4.stop();
    music5.stop();
   }
    else if(key == 'D' || key == 'd'){
    music1.stop();
    music2.stop();
    music3.stop();
    music4.stop();
    music5.stop();
    }
   
    
   if (key == 'T' || key == 't'){
    music1.stop();
    music2.play();
    music3.stop();
    music4.stop();
    music5.stop();
   }
   else if(key == 'D' || key == 'd'){
    music1.stop();
    music2.stop();
    music3.stop();
    music4.stop();
    music5.stop();
    }
   
      
   if (key == 'S' || key == 's'){
    music1.stop();
    music2.stop();   
    music3.play();
    music4.stop();
    music5.stop();
    }
    else if(key == 'D' || key == 'd'){
    music1.stop();
    music2.stop();
    music3.stop();
    music4.stop();
    music5.stop();
    }
    
    if (key == 'I' || key == 'i'){
    music1.stop();
    music2.stop();
    music3.stop(); 
    music4.play();
    music5.stop();
    }
    else if(key == 'D' || key == 'd'){
    music1.stop();
    music2.stop();
    music3.stop();
    music4.stop();
    music5.stop();
    }
    
    
   if (key == 'M' || key == 'm'){
    music1.stop();
    music2.stop();
    music3.stop();
    music4.stop();
    music5.play();
   }
   else if(key == 'D' || key == 'd'){
    music1.stop();
    music2.stop();
    music3.stop();
    music4.stop();
    music5.stop();
    }
   
   
}
   
