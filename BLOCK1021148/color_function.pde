//色の配列を指定すればランダムに返してくれる機能
int getCol(int array[]){
  return array[int(random(array.length))];
}



//余ってる個数でブロックの色を変える
void colorBlock(){
  
  int chk6=record1(block);
    
    if(chk6==2){
      r=random(100,200);
      g=random(0,150);
      b=random(200, 250);
      
    }else if(chk6==1){
      //青？
      r = random(00, 160);
      g = random(100, 220);
      b = random(200, 240);
      
    }else if(chk6==3){
      //紫
     r = random(100, 200);
     g = random(180, 210);
     b = random(0, 100);
    }else if(chk6==4){
      //ピンク
      r=random(210, 250);
      g=random(145, 200);
      b=random(100, 200);
    }else{
      //透明な虹色
      r=random(30,150);
      g=random(80,180);
      b=random(70,170);
    }
      
  fill(r, g, b,80);
  return;
}


//余ってるブロック個数で文字色を変える(一種類目）
void colortext(){
  
  int chk7=record1(block);
   if(chk7==2){
     //ブロックの数が中くらいの時
     fill(0,255,255);//Aqua
   }else if(chk7==1){
     //ブロックの余りが少ないとき
     fill(255,248,220);//cornSilk
   }else if(chk7==3){
     //ブロック数が多いとき
     fill(200,57,143);//カトレア
   }
   return;
}
     

//余ってるブロックの個数でテキストの色を変える(２種類目)
void morecolor (){
  int chk8=record1(block);
   if(chk8==2){
     //ブロックの数が中くらいの時
     fill(255,20,147);//violet
   }else if(chk8==1){
     //ブロックの余りが少ないとき
    r=random(230, 250);
    g=random(100, 250);
    b=random(150, 200);
    
    fill(r, g, b, 30);
   }else if(chk8==3){
     //ブロック数が多いとき
     fill(255,105,180);//HotPink
   }
   return;
}   

void rainbow(){
  float c = random(0,255);

  //横の移動を500回繰り返す(i = 0,1,2...508,509)
  for(int i = 0;i < width;i ++){
    //縦の移動を500回繰り返す(j = 0,1,2...508,509)
    for(int j = 0;j < height;j ++){
      stroke(c,255-j/2,i/2);
      point(i,j);
    }
  }
 
}





  
