void initBall() {
  
  //初期化
  int i;
  for(i=0;i<x.length;i++){
  x[i]= 0;
  y[i]= 0;
  }
  
  dx =random(2,8);
  dy =random(5,10);
  
  return;
}


void DrowBall(){
  
     x[x.length-1]=x[x.length-2]+dx;
     
     y[y.length-1]=y[y.length-2]+dy;
    
  
  
 int i;
  
 for(i=0;i<x.length-1;i++){
    x[i]=x[i+1];
    y[i]=y[i+1];
  }
  
  for(i=0;i<x.length;i++){
    
    //以下、平行移動
   
    r=random(60,200);
    g=random(90,200);
    b=random(200,250);
    
    fill(r,g,b,80);
    ellipseMode(CORNER);
    stroke(176,184,214,50);//ShinyPurple
    strokeWeight(4);
    
    ellipse(x[i], y[i], b_w, b_h); // ball
   
  
  }
  return;
}
