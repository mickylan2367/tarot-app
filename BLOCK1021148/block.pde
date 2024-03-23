/*
 10個のブロックを初期化する
*/
void initBlocks() {
  
  for (int i = 0; i < block.length ; i++) {
    //block耐久値
    block[i] = int(random(1,4));
  }
  
  //ブロックのy座標の初期化
  for(int i=0; i<block.length;i++){
    for(int j=0;j<blockn.length;j++){
     
     blocky[i][0]= -(random(0,2000));
     blocky[i][j] = blocky[i][0];
     
    }
  }
 
 
 bw = width / block.length;
 
 }



/*
 10個のブロックのどれかにぶつかっていたら跳ね返る
*/



void checkBlocks() {
  for (int i = 0; i < block.length ; i++) {
    if (block[i] > 0) {
      int ret = blockHitCheck(i*bw,blocky[i][blockn.length-1],bw,bh,x[x.length-1],y[y.length-1],b_w,b_h,dx,dy);
      if (ret > 0) {
         
         soundfile = new SoundFile(this, "strange_wave.mp3");
         soundfile.play();
         soundfile.amp(0.09);
        
        if (ret == 1) {
          dx = -dx*e;
          block[i]--;
        } else if (ret == 2) {
          //gv = -gv;
          dy = -dy*e;
          block[i]--;
        } else if (ret == 3) {
          //gv = -gv;
          dx = -dx*e;
          dy = -dy*e;
          block[i]--;
        }
        return;
      }
      }
    }
    
  }  




/*
 10個のブロックを表示する
*/


void showBlocks() {
  
 //各ブロックのy座標を更新する
  for(int i=0;i<block.length; i++){
     blocky[i][blockn.length-1] = blocky[i][blockn.length-2] + bdy;
  }
    
  //同じ列、、一つ前の行に挿入
  for(int i=0;i<block.length;i++){
    for(int j=0;j<blockn.length-1;j++){
      blocky[i][j] = blocky[i][j+1];
    }
  }
       
    
  for(int i=0;i<block.length;i++){
  if (block[i] > 0) {
     
      colortext();
      textSize(10);
      text(block[i], (i+1/2)*bw, blocky[i][0]+bh/2+10); // 消すために必要なhitの個数
         
      colorBlock();
      drawBlock();
     
    }
   
    
  bl_rot+=0.06;
  }
}

void drawBlock(){

  for (int i=0; i < block.length; i++) {
    for(int j=0;j<blockn.length;j++){
    
    if(block[i]>0){
    pushMatrix();
    
    translate(i*bw,blocky[i][j]);
    
    rotate(bl_rot);
    
    //ellipse(i*bw, by, bw, bh);
    
    ellipseMode(CENTER);
    ellipse(0,0,bw/2,bh/2);
    
    popMatrix();
    }
   }
 }
 


   
}
  
 
  
  
  
