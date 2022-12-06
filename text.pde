void TEXT(){
  textAlign(LEFT,BOTTOM);
 //ブロック配列チェックの変数
   int sum = record2(block);
   
 //残り時間
   int T = timer.remain();
   int t = timer.TIME();
 
 //途中でラケット動きます。
 if((sum>0)&& t>30){
    PFont font3 = loadFont("SourceCodePro-SemiboldIt-48.vlw");
    textSize(15);
    textFont(font3);
    text("Move your racket!",30,100);
  }
 
  //10秒前表示
 if((sum>0)&& (7<=T)&&(T<=12)){
    textSize(20);
    text("10sec",30,140);
 }

 if((sum>0)&& (2<T)&&(T<7)){
   //５秒前表示
    textSize(20);
    text("5sec",30,140);
  }
 
 if((sum>0)&&(0<=T)&&(T<=2)){
   textSize(19);
   PFont font2 = loadFont("NotoSerif-LightItalic-48.vlw");
   textFont(font2);
   text("....now calculating ",10,350);
    //時間が来たら、ボールを止める
    dx=0;
    dy=0;
  }
  
   if((sum==0)&&(T>0)){
    bdy=0;//ブロックはそれ以上落ちない。
    //backgroundのように画面を変える
    
    PImage img = loadImage("galaxy.jpg");
    image(img, 0,0,width, height); 
    textAlign(CENTER,CENTER);
    textSize(20);
    fill(255,215,0);
    text("Take it easy,EveryThing will be Alright. You have all",width/2,height/2);
     
    }
  
  
   if((COUNT<=0)&&(T>0)){//スイッチ代わりに。。。
        
     //ラケットの耐久値が先になくなったら、集中力不足
     
     //先にラケットの耐久値が減ってしまったら、start画面に戻ってもらう。
     bdy =0;
     dx=0;
     dy=0;
     background(0);
     textSize(50);
     fill(255,215,0);
     textAlign(LEFT,BOTTOM);
     text("You should think about details before start tarot", 10, 350); 
     
     
     if(mousePressed){
       
       Page=0;
     }
     
   
   }
   
  
return;
}
