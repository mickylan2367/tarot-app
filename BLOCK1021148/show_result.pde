void showResult(){
   int sum = record2(block);
   int chk=record3();
   int chk1=record4();
   textSize(20);
   background(0);
   
   PImage img = loadImage("coffee-3025022_1280.jpg");//とりあえず初期化する
   
    //要チェック！！
    if(chk==0){
       //uranus
       img = loadImage("uranus.jpg");
       
       
      
     }
     
    if(chk==1){
     //mercury
     img = loadImage("mercury.jpg");
      
     }
     
    if(chk==2){
     //moon
     img = loadImage("moon.jpg");
     }
     
    if(chk==3){
    //venus
     img = loadImage("venus.jpg");
     //not yet checked image(img, 0,0,height,height); 
    }
    
    if(chk==4){
      //牡羊座
     img = loadImage("3D iPhone Wallpapers.jpg");
     
     
     
     
    }
    
    if(chk==5){
      
      img = loadImage("earth.jpg");
      
      /*
      //牡牛座
      background(255);
      int[] tauColors = {#DFCB8C, #B4BB8C, #E1C0B6, #EBEBC1, #B2CDBA, #9A8EB6, #BA6F87, #DFC1AF, #A49070};
      devide_rect(10, 10, width-20, height-20, 5,tauColors); 
      
      //正面に出てくるヘキサゴン
      strokeWeight(2);
      stroke(110,74,32);
      noFill();
      drawHexagons(width/2, height/2, height/2, 120);*/
      //image(img,20,350,300,300);
      
    }
    
    if(chk==6){
      //双子座
      img = loadImage("gemini.jpg");
    }
    
    if(chk==7){
      //蟹座
      img = loadImage("coffee-3025022_1280.jpg");
    }
    
    if(chk==8){
      //獅子座
      img = loadImage("flowergirl.jpg");
    }
    
    if(chk==9){
      //乙女座
      img = loadImage("herp.jpg");
    }
    
    if(chk==10){
      //木星
      img = loadImage("jupiter.jpg");
    }
    
    if(chk==11){
      //天秤座
      img = loadImage("OrangeSea.jpg");
    }
    
    if(chk==12){
      //海王星
      img = loadImage("neptune.jpg");
    }
    
    if(chk==13){
      //蠍座
      img = loadImage("about death.jpg");
    }
    
    if(chk==14){
      //射手座
      img = loadImage("KAGAYA (@KAGAYA_11949).jpg");
    }
    
    if(chk==15){
      //山羊座
      img = loadImage("ForestCaprocorn.jpg");
    }
    
    if(chk==16){
      //火星
      img = loadImage("mars.jpg");
    }
    
    if(chk==17){
      //水瓶座
      img = loadImage("milky-way.jpg");
    }
    
    if(chk==18){
      //魚座
      img = loadImage("Black Gold Black Gold Background.jpg");
      /*
      fl = new Flower(0,0,height/2,5,2);
      background(250,220,226);
      strokeWeight(0.2);
      stroke(247,248,208);
  
      color c = lerpColor(color(246,235,225), color(163,183,222),0.7);
      fill(c);
  
      pushMatrix();
      translate(width/2,height/2);
      rotate(rot);
      fl.flower();
      popMatrix();
  
      rot +=0.003;*/
    }
    
    if(chk==19){
      //太陽
      img = loadImage("sun.jpg");
    }
    
    if(chk==20){
      //冥王星
      img = loadImage("pluto.jpg");
    }
    
    if(chk==21){
      //土星
      img = loadImage("saturn.jpg");
    }
    
    image(img, 0,0,width,height); 
   
   
   //background(0);
   
  //文字
    fill(255);
    textSize(20);
    
    PFont font1 = loadFont("MonotypeCorsiva-48.vlw");
    textFont(font1);
    
    String list[] = loadStrings("The stars.txt");
    text(list[2*chk],20,250);
    text(list[2*chk+1],20,300);
    String starsResult = list[2*chk];
    
    String list1[]=loadStrings("Houses.txt");
    text(list1[2*chk1],20,350);
    text(list1[2*chk1+1],20, 400);
    String houseResult = list1[2*chk1];
    
    
  //採点結果を表示 
  textSize(16);
  morecolor();
  text("more"+sum,10,70);
  
  
  //ファイルに書き込み
  String lines[] = {starsResult, houseResult};
  saveStrings("Result.txt", lines);
  /*
  解釈の仕方やコメントを表示
  */
  
  
 
    }
