PImage sun ;
PImage earth ;
PImage moon ;
float moonMove =0;
float earthMove = 0;
final int RADIUS =200; 

void setup (){
  
  size(600,600);
  sun = loadImage("sun.png");
  earth = loadImage("earth.png");
  moon = loadImage("moon.png");

}
void draw(){
  background(0);
  imageMode(CENTER);
  
  //first Matrix - SUN vs EARTH
  pushMatrix();
  translate(width/2,height/2);
  image(sun,0,0);
  
  noFill();
  stroke(255);
  ellipse(0,0,RADIUS*2,RADIUS*2);
  float a = atan2(mouseY-width/2,mouseX-height/2);
  rotate(a);
  
  image(earth,RADIUS,0);
  
      //SECONG EARTH VS MOON
  pushMatrix();
  translate(RADIUS,0);
  float m = map(moonMove,-100,100,-PI,PI);
  if(moonMove ==100){
    moonMove = -100;
  }
  moonMove++;
  rotate(m);
  image(moon,50,0);
  popMatrix();
  
      //THIRD EARTH rotate itself
  pushMatrix();
  translate(RADIUS,0);
  
  earthMove++;
  float n = map(earthMove,-200,200,-PI,PI);
  rotate(n);
  image(earth,0,0);
  if(earthMove ==200){
    earthMove = -200;
  }
  popMatrix();
  popMatrix();
}
