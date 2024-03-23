void set_background(){ 
  int i;
  //初期化
  for(i=0;i<circ1.length;i++){
    //半径をランダムに決めてもらう
    circ1[i]=random(4,9);
  }
  for(i=0;i<circ2.length;i++){
    circ2[i]=random(4,8);
  }
 
 for(i=0;i<lines1.length;i++){
   lines1[i]=random(i*width/5, (i+1)*width/5);
   lines2[i]=random(i*width/5, (i+1)*width/5);
 }
    //さて、図形を描くぞい
   smooth();
   
   for(i=0;i<circ1.length;i++){
     
    noStroke();
    //色１
    r=random(180, 255);
    g=random(0, 80);
    b=random(50, 100);
    fill(r, g, b);//赤
    circle(lines1[0], random(0,height/3),circ1[i]);
    circle(lines1[4],random(height*2/3, height),circ1[i]);
    
    r=random(0, 100);
    g=random(120, 200);
    b=random(70, 130);
    fill(r, g, b);//き
    circle(lines1[2],random(height/3,height*2/3),circ1[i]);
   }
    
   
   for(i=0;i<circ2.length;i++){
    //色２
     noStroke();
     r=random(100, 200);
     g=random(140, 180);
     b=random(150, 250);
     fill(r, g,b);
     circle(lines1[1],random(0,700),circ2[i]);
     circle(lines1[3], random(0,700), circ2[i]);
   }
   

 
  return;
}
  
  
void set_startBackground(){
  background(177,163,193);
  //strokeWeight(0.2);
  
  fill(249,232,235);
  rect(0,0,width/3,height/3);
  
  fill(178,109,145);
  //stroke(122, 138, 147);
  rect(width/3,0, width/3, height/3);
  
  fill(167,50,121);
  //stroke(67, 58, 88);
  rect(width*2/3, 0, width/3, height/3);
  
  fill(187,142,172);
  rect(0, height/3, width/3, height/3);
  
  
  
  fill(204,154,168);
  rect(width*2/3, height/3, width/3, height/3);
  
  fill(163,161,206);
  //stroke(205,101,159);
  rect(0, height*2/3, width/3, height/3);
  
  fill(231,202,202);
  //stroke(130, 154, 201);
  rect(width/3, height*2/3, width/3, height/3);
  
  fill(124,90,122);
  //stroke(119, 194,185);
  rect(width*2/3, height*2/3, width/3, height/3);
}



void devide_rect(float x, float y, float w, float h, int n,int array[]){
   noLoop();
   float i = random(0.1, 0.9);
   color c3 = getCol(array);
   color c4 = getCol(array);
   color c =lerpColor(c3, c4, i);
   stroke(c);
   fill(getCol(array));
   rect(x, y,w,h,n);
   n--;
  
  
  if(n>=0){
    if(w>=h){
       float randomWidth = random(0.1, 0.9)*w;
       devide_rect(x, y, randomWidth, h, n,array);
       devide_rect(x + randomWidth, y, w - randomWidth, h, n,array);
     }else{
       float randomHight = random(0.1, 0.9)*h;
       devide_rect(x, y, w, randomHight,n,array);
       devide_rect(x, y + randomHight,w, h - randomHight, n,array); 
    }
 } 
}




  
