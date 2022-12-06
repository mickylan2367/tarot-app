/*float r = 0;
 float r1=1;
 float R=0;
 
 for(int i=0;i<7;i++){
 
 
 if(i==0){
 R = r + r1;
 }else{
 println(R);
 R += r1;
 }
 
 
 }*/

/*//フィボナッチ数列の実装
 int fib[]= new int [10];
 
 for(int i=2;i<fib.length;i++){
 fib[0]=0;
 fib[1]=1;
 fib[i] = fib[i-2]+fib[i-1];
 
 println(fib[i]);
 }
 */

/* Flower fl;
 

void setup() {
  size(displayWidth,displayHeight);
  fl = new Flower(random(width), random(height), random(2*height/5), 5,2);
  noFill();
  //noLoop()
}

void draw() {
  background(204,222,238);
  stroke(255,250,245);
  strokeWeight(0.2);
  
  fill(241,216,225);
  fl.flower();
  //fl.lerpflower(color(255,0,0),color(0,255,0));
  //fl.SQFlower(3);
  //fl.FL(0.36,0.12,0.07);
}*/

int flowerColor[]={#F4F3F6,#87BFC1,#EDE795,#EEF2EF,#F5F0D6,#B0DBD4,#F0CED3};
int fc1=getCol(flowerColor);
int fc2=getCol(flowerColor);
int fc3=getCol(flowerColor);
int fc4=getCol(flowerColor);

//さてさてどうしたものかな、お花
class Flower{
  float ox,oy;
  float size;
  float n; 
  float k;
  //int NUM;
  //float array[][]= new float [NUM][NUM]; //配列一行目はぶろっくのX座標、二行目はブロックのY座標
    
  Flower(float tx, float ty, float s, float N, float K /*,int num*/){
    ox = tx;
    oy = ty;
    size = s;
    n = N;
    k = K;
    //NUM=num;
  }
  
  
 /* void initflowers(){
    
    for(int i=0;i<=NUM;i++){
      for(int j=0;j<=NUM;j++){
         
        array[i][j]=random(0,width);
      }
    }
  }*/
      
  
  

  void flower() {
    pushMatrix();
    translate(ox, oy);

    beginShape();
    for (float theta=0; theta<=90; theta+=0.06) {

        float r = sin(n*theta/k);//極座標

        float x=size*r*cos(theta);
        float y=size*r*sin(theta);

        vertex(x, y);
      }
    endShape(CLOSE);
    popMatrix();
  }

  void lerpflower (color c1,color c2) {
    pushMatrix();
    translate(ox, oy);
    for (float i=0; i<= size; i +=2) {
      color c = lerpColor(c1, c2, i/size);
      fill(c);
    
     beginShape();  
     for (float theta=0; theta<360; theta+=0.06) {

        float r = i*sin(n*theta/k);//極座標

        float x=size*r*cos(theta);
        float y=size*r*sin(theta);

        vertex(x, y);
      }
    endShape(CLOSE);
  }
  
  popMatrix();
 }




  void SQFlower(){//此花はうまくいかなかった。
    pushMatrix();
    translate(ox, oy);
    float R=1;//とり合えず初期化
       
    
    beginShape();
    for (float theta=0; theta<=90; theta+=0.06) {
       
      //for(int i=m;i>0;i--){
        R = sq(sin(2*theta));//極座標
        
    
        float x=size*R*cos(theta);
        float y=size*R*sin(theta);

        vertex(x, y);
        
      }
    endShape(CLOSE);
    popMatrix();
  }
  
  
  void FL(float a, float b, float c){
    pushMatrix();
    translate(ox, oy);

    beginShape();
    for (float theta=0; theta<=90; theta+=0.06) {

        float r = sin(n*theta/k)+ a*sin(3*n*theta/k) + b*sin(5*n*theta/k) + c*sin(7*n*theta/k);//極座標

        float x=size*r*cos(theta);
        float y=size*r*sin(theta);

        vertex(x, y);
      }
    
    endShape(CLOSE);
    popMatrix();
  }
  
 
    
}

/*間違って消しませんよう
void flower (float ox, float oy, float size, float n, float k) {
  pushMatrix();
  translate(ox, oy);

  beginShape();
  for (float theta=0; theta<360; theta+=0.06) {

    float r = sin(n*theta/k);//極座標

    float x=size*r*cos(theta);
    float y=size*r*sin(theta);

    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}*/
