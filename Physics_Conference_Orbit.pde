float x,y,vx,vy,a,r,ax,ay,x2,y2,v,KE,PE,ME;
float dx,dy,dr,dth,drh,drhx,drhy,rhx,rhy,xp,yp,A;


void setup(){
  frameRate(600);
  x=0;
  y=100;
  x2=width/2;
  y2=height/2;
  vx=1.1;
  vy=-0.01;
  size(1280,730);
}

void draw(){
  background(0);
  stroke(0,0,50);
  fill(0,0,255);
  ellipse(x2,y2,20,20);
  stroke(0,0,255);
  if (keyPressed){
    if(key=='w'){ //forward boost
      vx=vx+A*drhx;
      vy=vy+A*drhy;
      ellipse(x+x2-(3*drhx),y+y2-(3*drhy),20,20);
    }
    if(key=='a'){ //left boost
      vx=vx+A*drhy;
      vy=vy-A*drhx;
      ellipse(x+x2-(3*drhy),y+y2+(3*drhx),20,20);
    }
    if(key=='s'){ //backward boost
      if(v>0.01){
        vx=vx-A*drhx;
        vy=vy-A*drhy;
        ellipse(x+x2+(3*drhx),y+y2+(3*drhy),20,20);
      }
      if(v<=0.01){
        vx=0;
        vy=0;
        ax=0;
        ay=0;
        ellipse(x+x2,y+y2,24,24);
      }
    }
    if(key=='d'){ //right boost
      vx=vx-A*drhy;
      vy=vy+A*drhx;
      ellipse(x+x2+(3*drhy),y+y2-(3*drhx),20,20);
    }
    if(key=='z'){
      frameRate(1);
    }
    if(key=='x'){
      frameRate(60);
    }
    if(key=='c'){
      frameRate(600);
    }
  }
  stroke(50,0,0);
  fill(255,0,0);
  ellipse(x+x2,y+y2,20,20);
  r=sqrt((x*x)+(y*y));
  A=.002;
  a=-100/(r*r);
  ax=a*x/r;
  ay=a*y/r;
  vx=vx+ax;
  vy=vy+ay;
  x=x+vx;
  y=y+vy;
  xp=x-vx;
  yp=y-vy;
  dx=x-xp;
  dy=y-yp;
  v=sqrt(vx*vx+vy*vy);
  dr=sqrt(dx*dx+dy*dy);
  drhx=dx/dr; //cosTheta
  drhy=dy/dr; //sinTheta
  KE=v*v/2.;
  PE=-100/(r);
  ME=KE+PE;
  fill(255);
  text("velocity="+str(v),40,40);
  text("acceleration="+str(a*-1),40,50);
  text("distance="+str(r),40,60);
  text("Kinetic Energy="+str(KE),40,70);
  text("Potential Energy="+str(PE),40,80);
  text("Mechanical Energy="+str(ME),40,90);
  //if(x+x2>=x2-10&&x+x2<=x2+10&&y+y2<=y2+21&&y+y2>=y2){ //fix this //for simple bouncing (dist(x+x2,y+y2,x2,y2)<21){
  //  vy=vy*-1;
  //}
}