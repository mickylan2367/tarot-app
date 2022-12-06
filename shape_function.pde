void drawHeart(float  ox, float oy, float size) {
  pushMatrix();
  translate(ox, oy);
  beginShape();
  for (int theta = 0; theta < 360; theta++) {
    float x = size * (16 * sin(radians(theta)) * sin(radians(theta)) * sin(radians(theta)));
    float y = (-1) * size * (13 * cos(radians(theta)) - 5 * cos(radians(2 * theta))
      - 2 * cos(radians(3 * theta)) - cos(radians(4 * theta)));

    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}


void RECT(float ox, float oy, float hs, float r, float g, float b){
  pushMatrix();
  
  translate(ox, oy);
  stroke(r, g, b);
  strokeWeight(5);
  noFill();
  rectMode(CENTER);
  rect(0, 0, 2*hs, 2*hs);
  
  popMatrix();
}
  

void Rect(float ox, float oy, float hs){
  //hsはHalfSizeの略

   pushMatrix();//座標を格納
   translate(ox, oy);//中心座標を参照
 
    r=random(130,230);
    g=random(10,130);
    b=random(130, 180); 
   stroke(r, g, b);
   
   //stroke(255);
   beginShape();//図形が始まるよ
   vertex(hs, hs);
   vertex((-hs),hs);
   vertex((-hs), (-hs));
   vertex(hs, (-hs));
   endShape(CLOSE);
   
   popMatrix();
}




void drawRect(){
  //さあ、正方形を描こう
  
  //小さくなる速さ
  float d_hs=1;
  
  pushMatrix();
    //background(0);
    translate(width/2,height/2);
    rotate(rot);
 
    fill(0);
    strokeWeight(5);
    Rect(0,0,HS);
    
    strokeWeight(0.2);
     fill(255,0,0);
    drawHeart(0,0, size);
    
    
    //小さくなりすぎたら初期化する
    if(HS>8){
        HS -= d_hs;
        }else{
          HS = height/2;//もとに戻す
        }
    rot +=0.006;
    
    //if(size<
    
  popMatrix();
     //set_background();は必ずこの文の後に書くこと
}


void drawRECT(float ox, float oy){
   //さあ、正方形を描こう
  
  //小さくなる速さ
  float d_hs=1;
  
   pushMatrix();
    //background(0);
    translate(ox,oy);
    rotate(rot);
 
    RECT(0,0,Hs,random(150, 220), random(150,230),random(30,150));
    
    
    //大きくなりすぎたら初期化する
    if(Hs<width/2){
        Hs += d_hs;
        }else{
          Hs = 0;//もとに戻す
        }
    rot +=0.006;
  popMatrix();
     
}


 void drawCircle(float x, float y, float radius,float n){
  
   strokeWeight(2);
   color h = lerpColor(c1, c2, i);
   stroke(h);
   noFill();
   ellipse(x,y,radius,radius);
  
   if(radius >n){
    drawCircle(x + radius/2, y, radius/2,n);
    drawCircle(x - radius/2, y, radius/2,n);
    drawCircle(x, y + radius/2, radius/2,n);
    drawCircle(x, y - radius/2, radius/2,n);
  }
  
}
  
  
void HEART(int n){
   noLoop();
   for(int i = n;i>=5;i -= 4){
     color c = lerpColor(c1, c2, 0.75*i/n);
     fill(c);
     drawHeart(width/2, height/2, i);
   }
}

void Horoscope(float ox, float oy, float r){  //12角形Horoscope
    
    strokeWeight(0.5);
    pushMatrix();
    translate(ox,oy);
    
    //まず、大きな１２角形を書く
   noStroke();
   
   fill(235, 219, 224);
   beginShape();
    for(int i=0;i<12;i++){
      vertex(r*cos(i*radians(360.0/12.0)),r*sin(i*radians(360.0/12.0))); 
    }
    endShape(CLOSE);
    
    //次に小さな１２角形を書く
    fill(215, 138, 146);
    beginShape();
    for(int i=0;i<12;i++){
      vertex((r*2/3)*cos(i*radians(360.0/12.0)),(r*2/3)*sin(i*radians(360.0/12.0))); 
    }
    endShape(CLOSE);
    
    //最後に中心からの線を描写する
    stroke(216, 167, 103);//クリームブリュレ(黄金に近い)
    beginShape();
    for(int i=0;i<12;i++){
      vertex(r*cos(i*radians(360.0/12.0)),r*sin(i*radians(360.0/12.0))); 
      vertex(0,0);
    }
    endShape(CLOSE);
    
    popMatrix();
}

void Hexagon(float ox, float oy, float r){
  pushMatrix();
  translate(ox, oy);
  rotate(PI/6);
  beginShape();
  for(int i=1;i<7;i++){
   vertex(r*cos(i*PI/3),r*sin(i*PI/3));
  }
  endShape(CLOSE);
  popMatrix();
}

void Triangle(float ox, float oy, float r) {
  pushMatrix();
  translate(ox, oy);  // 中心となる座標
  rotate(radians(-90));

  // 円を均等に3分割する点を結び、三角形をつくる
  beginShape();
  for (int i = 0; i < 3; i++) {
    vertex(r*cos(radians(360*i/3)), r*sin(radians(360*i/3)));
  }
  endShape(CLOSE);

  popMatrix();
}


void MagicArray(float ox, float oy, float r){
  
  pushMatrix();
  translate(ox,oy);
  
  noFill();
  Triangle(0,0,r);
  
  pushMatrix();
  translate(0, 0);
  rotate(PI);
  Triangle(0,0,r);
  popMatrix();
  
  
  noFill();
  Hexagon(0,0,r);
  
  popMatrix();
}

void drawHoroscope(){
  stroke(158,115,96);
  strokeWeight(5);
  fill(194, 81, 102);
  circle(width/2,height/2,height-90);
 
  Horoscope(width/2,height/2,(height/2)-50);
  
  strokeWeight(2);
  noFill();
  MagicArray(width/2,height/2,((height/2)-50)*2/3);
 
 
 circle( (width-(height-90))/4,               height/2, (width-(height-650))/4 );
 circle( (height-90)+3*(width-(height-90))/4, height/2, (width-(height-650))/4 );
}



void drawHexagons(float ox, float oy, float radius,float n){
  
   pushMatrix();
   translate(ox, oy);
   noFill();
   Hexagon(0,0,radius);
  
   radius = sqrt(3)*radius/2;
   
   
   if(radius >n){
     for(int i=0;i<7;i++){
       pushMatrix();
       rotate(i*PI/3);
       drawHexagons(radius* cos(i*PI/3), radius* sin(i*PI/3), radius/2, n);
       popMatrix();
     }
     
   
  }
  popMatrix();
  
}
