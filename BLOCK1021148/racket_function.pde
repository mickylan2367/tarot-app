

/*
  float r_y;  // r_yはラケットのy座標
*/

void checkAndShowRacket(float r_y) {
  float r_x = mouseX; // r_x はラケットの左側のx座標
  
  if (r_x + r_w > width) { // 右に寄りすぎていたら補正する
    r_x = width - r_w;
  } 
  
  /* ブロックがぶつかっていたら、ボールは上に跳ね返り、ラケットの耐久値が上がる*/
   int chk= blockHitCheck(r_x,r_y,r_w,r_h,x[x.length-1],y[y.length-1],b_w,b_h,dx,dy);
  if(chk>0){
    soundfile = new SoundFile(this, "magic6.mp3");
    soundfile.play();
    soundfile.amp(0.2);
  if (chk==1){
    dx = -dx;
    COUNT++;
  }else if(chk==2){
    //gv = -gv;
    dy = -dy*e;
    COUNT++;
   }else if(chk==3){
    //gv = -gv;
    dx = -dx;
    dy = -dy*e;
    COUNT++;
  }
  }
  
  /*ラケットにブロックが当たるとラケットの耐久値がブロックの耐久値分、下がる*/
  for(int i=0;i<block.length;i++){
   
    if(block[i]>0){
      
      chk = blockHitCheck(r_x,r_y,r_w,r_h,i*bw,blocky[i][blockn.length-1],bw,bh,0,bdy);
      
      if(chk>0){
        COUNT--;
        soundfile = new SoundFile(this, "powerdown03.mp3");
        soundfile.play();
        soundfile.amp(0.2);
     }
  }
  }
  
  if(COUNT>40){
    soundfile = new SoundFile(this, "strange_bell .mp3");
    soundfile.play();
    soundfile.amp(0.2);
    COUNT=2;//生命力はたまりすぎてもだめ、ドーピングすると危機に陥る。
  }
  
  
  
  noStroke();
  pushMatrix();
  translate(r_x+r_w/2, r_y+r_h/2);
  rotate(r_rot);
  rectMode(CENTER);
  rect(0, 0, r_w, r_h,20); // racketを表示する
  
  fill(238, 120,0);
  textAlign(CENTER,CENTER);
  PFont font = loadFont("CenturyGothic-48.vlw");
  textFont(font);
  textSize(50);
  text(COUNT,0,0);
  
  popMatrix(); 
  
  r_rot -= 0.06;
  
  return;
  }
 
 
 
