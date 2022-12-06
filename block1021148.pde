/*
図形を描くときに変化させる溜めの変数等々、先に説明しておかないと後でヤバいことになりそう。

6/13さらなる工事を開始
1. devide_rectは結果表示に使うことにした。結果表示をそれぞれのタロットごとに変えられるように工夫する。
2.ゲーム画面のウィンドウを表示する
3.過去のデータを表示させるためのウィンドウを作成する
4.お花とか作ってみて実装する/csvfileの作り方を学んでみる/占った内容について、記録できるようにする。
5.１２星座分作るgame種類


*/

//音のライブラリを導入します
import processing.sound.*;
SoundFile soundfile;

//ブロックの個数、座標の格納、大きさ（ランダム)、回転する速さ
int k = int(random(20, 30));//block個数
int n = int(random(5,15));
int block[] = new int[k];
float blockn[] = new float [n];
float blocky[][] = new float [k][n];
float bw,bh=100;
float bdy=2;
//float by=40;<工事中
//その場でひとつづつ回転するブロックを描くための回転変数
float bl_rot =0;


//ボールの位置、大きさ、速度(ランダム)
int m = int(random(5,30));
float x[] = new float[m];
float y[] = new float[m];
float b_w = random(50,80), b_h = b_w, dx, dy;
//float gv = 0.98;


//後ろのぱちぱちを用意する時に使う配列
float circ1[]={4};
float circ2[]={7};
float lines1[]= new float[5];
float lines2[]= new float[5]; 

//ラケットの大きさ
float r_w = random(70, 100), r_h = r_w;
float r, g, b;

//ラケット回転変数
float r_rot=0;
//ラケットに対する跳ね返り係数をランダムに設定
float e =random(0.9, 1.1);

//
int COUNT = 5;

//ハートの回転角度変数、ハートの初めの大きさ
float rot=0;
float size=2;
float d_size=0.006;


//水晶の色を設定するときに使うカラー変数
color c1 = color(255, 140, 0);
color c2 = color(0, 255, 255);

//ページ指定
int Page=0;

//背景で回る長方形の辺の長さの半分
float HS=height/2;
float HS1=0;
int countRect = 0;
float Hs = 0;

//class timerのグローバル変数化
Timer timer;
//class flowerのグローバル変数化
int NUM;
float array[][]= new float [NUM][NUM]; //配列一行目はお花のX座標、二行目はお花のY座標
Flower fl1;
Flower fl2;

//lerpColor変数
float i = random(0,1);


public void settings() {
  
  size(displayWidth,displayHeight/* , OPENGL*/);  
  initBall();
  initBlocks();
  soundfile = new SoundFile(this, "piano.wav");
  soundfile.loop();
  soundfile.amp(0.2);
}

void draw() {
 
  
  
 switch(Page){
    
 case 0:
 //始まりの画面 
   if(!mousePressed && width/3<mouseX && mouseX<2*width/3 && height/3<mouseY && mouseY<2*height/3){
    //マウスの位置によって背景を変える・中央の□中にマウスがあるとき
    background(40, 0, 23);
   
    fill(171, 217, 203);
    rect(width*3/4, 0, 100, height);
    fill(126, 56, 145,80);
    rect((width*3/4)+20,0,100, height);
 
    
    fill(229, 66, 145,60);
    rect(20,0,140, height);
    fill(248, 245, 176,80);
    rect(80, 0, 100, height);
    
    
    fill(233,146,188);
    rect(0,100,width,140);
    PFont font2 = loadFont("NotoSerif-LightItalic-48.vlw");
    textFont(font2);
    textSize(100);
    fill(187, 174, 212);
    textAlign(LEFT);
    text("Fortune Telling Tarot Card", 50, 100+100);
    
    fill(187, 174, 212,60);
    rect(0,11*height/13, width, 80);
    /*fill(223,146,188,100);
    textSize(100);
    text("click Heart and start",0,0);*/
   
    HEART(20);
    loop();
    
   }else{
    //初めの画面
    set_startBackground();
    drawCircle(width/2, height/2, width/2,72);
    
    pushMatrix();
    rotate(rot);
    drawCircle(0,0,width/3,72);
    popMatrix();
    
    pushMatrix();
    translate(0,height);
    rotate(-rot);
    drawCircle(0,0,width/3,72);
    popMatrix();
    
    pushMatrix();
    translate(width,0);
    rotate(-rot);
    drawCircle(0, 0, width/3,72);
    popMatrix();
    
    pushMatrix();
    translate(width,height);
    rotate(rot);
    drawCircle(0,0,width/3,72);
    popMatrix();
  
   }
    
    //描画の速さ
    translate(width/2,height/2);
    //画面の中心を軸にrotだけ回転
    rotate(rot);
    
    //ハートが光りすぎて輪郭がぼやけるのでstroke指定
    stroke(223, 146, 188);
    strokeWeight(0.3);
    
    //きらきら光るハートを描く
    r = random(223.0,250.0);
    g=random(42.0,148.0);
    b=random(84,145);
    fill(r, g, b);
    drawHeart(0,0,size);
    
    //Y軸方向角度を更新
    rot += 0.03;
    //ハートの大きさ(normal)
    size += d_size;
    
    //ハートの大きさ(程度で変化)
   if((size>6) && (!mousePressed)){
     //大きくなって、
     d_size = -d_size;
     }else if((size<2)&&(!mousePressed)){
       //ゆっくり戻る
       d_size = -d_size;
     }
   
     
   if(mousePressed && width*5/12<mouseX && mouseX<width*7/12 && height*5/12<mouseY && mouseY<height*7/12){
      soundfile.stop();
      Page=1;//game選択画面へ
      soundfile = new SoundFile(this, "waltz.mp3");
      soundfile.loop();
      soundfile.amp(0.1);
      fl1 = new Flower(0,0,height/3,5,2);
      fl2 = new Flower(0,0,height/6,5,4);
    }else if(mousePressed && (width*5/12>mouseX || mouseX>width*7/12 || height*5/12>mouseY || mouseY>height*7/12)){
      timer = new Timer(60000);//2minutes
      timer.Start();
      soundfile.stop();
      soundfile = new SoundFile(this, "clock2.mp3");
      soundfile.loop();
      soundfile.amp(0.1);
      Page=4; //過去のデータを表示する画面へ
    }
   
 break;
 
 case 1:
    //game選択画面
    background(230,191,162);
    drawHoroscope();
    
    pushMatrix();
    translate(width/2,height/2);
    rotate(rot/6);
    strokeWeight(0.2);
    stroke(246,190,200);
    fill(223,234,248,50);
    fl2.flower();
    popMatrix();
    
    
    PFont font = loadFont("CenturyGothic-48.vlw");
    fill(158,115,96);
    textFont(font);
    textSize(50);
    textAlign(CENTER);
    text("Choose",(width-(height-90))/4,               (height/2)+20);
    text("Stages",(height-90)+3*(width-(height-90))/4, (height/2)+20);
   
    strokeWeight(0.4);
    noFill();
    
    pushMatrix();
    rotate(rot);
    stroke(fc1);
    //drawCircle(0,0,width/3,72);
    fl1.flower();
    popMatrix();
     
    pushMatrix();
    translate(0,height);
    rotate(-rot);
    //drawCircle(0,0,width/3,72);
    stroke(fc2);
    fl1.flower();
    popMatrix();
     
    pushMatrix();
    translate(width,0);
    rotate(-rot);
    //drawCircle(0, 0, width/3,72);
    fl1.flower();
    stroke(fc3);
    popMatrix();
     
    pushMatrix();
    translate(width,height);
    rotate(rot);
    //drawCircle(0,0,width/3,72);
    stroke(fc4);
    fl1.flower();
    popMatrix();
   
    //Y軸方向角度を更新
    rot += 0.06;
    
    
    //牡羊座領域
    if(bottunAries()==true){
      background(0);
      set_background();
      
      int[] ariesColors = {#E50011, #EE7700, #FFF000, #00A73B, #0064B3, #5F1885, #2A2489, #FEFEFE, #000000};
      color c = getCol(ariesColors);
      fill(c);
      
      textFont(font);
      textAlign(CENTER);
      textSize(200);
      text("ARIES STAGE",width/2,(height/2)+20);
      
      
      if(mousePressed){
         soundfile.stop();
         soundfile = new SoundFile(this,"moveslowly!.mp3");
         soundfile.loop();
         soundfile.amp(0.1);
         Page = 2;
         timer = new Timer(2*60000);//2minutes
         timer.Start();
      }
    }
 
 break;
    
 case 2:
   
 //カード選定  
    background(0); 
    drawRect();//回りながら小さくなる謎の四角形
    drawRECT(width/4, height/2);
    drawRECT(width*3/4, height/2);
    set_background();
 
  //背景にhoroscopeを書く
    drawHeart(width/4, height/2, 3);
    drawHeart(width*3/4,height/2,3);
    DrowBall();

    checkBlocks();
    showBlocks();
  
    //途中からラケット、動きます。
    int t = timer.TIME();
    if(0<t && t<30){ checkAndShowRacket(height/2);}
      else{checkAndShowRacket(mouseY);}
    
  
  //止まったら初期化
    if(((0<dx)&&(dx<0.2))||((0<dy)&&(dy<0.2))){
      initBall();
    }
  
  
  // 壁との衝突
    if (y[y.length-1] + b_h >= height) {
      initBall();
    }
    
    if (x[x.length-1]< 0 || x[x.length-1]+b_w >=width) {
        dx = -dx;  
      }
   
    if (y[y.length-1] < 0) {
      dy = -dy;
      }
      
      
    if(COUNT==0){
      //ここ誰か助けて…
      soundfile.stop();
      soundfile = new SoundFile(this,"witch.mp3");
      soundfile.loop();
      soundfile.amp(0.1);
    }
   
   //途中でコメントを表示させることと、カウントダウン
    TEXT();
    
    
    
    if(timer.isfinished()){
      Page = 3;
      
      
    }
    
  
  break;
  
  case 3:
   //result
   showResult();
  break;
  
  case 4:
  //Page0番目から飛んでくる予定
   //what you wished in the past and its result
   rainbow();
   
   String result[] = loadStrings("Result.txt");
   
   
   fill(213,147,163);
   textAlign(CENTER);
   textSize(100);
   text(result[0],width/4,height/4);
   text(result[1],3*width/4,3*height/4);
   
   
  if(timer.isfinished()){
      Page = 0;
      soundfile.stop();
      
      soundfile = new SoundFile(this, "piano.wav");
      soundfile.loop();
      soundfile.amp(0.09);
   }
  break;
  
  case 5:
    //いくつかボタンを作る
    //horoscopeを表示させて、それをボタンにする。[何を占うの？]など。
  break;
  
 
 }
  }
  
  
