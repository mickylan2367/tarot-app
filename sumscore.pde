//ブロックの余りを種別する
int record1(int array[]){
 
 int sum = 0;
 for (int i = 0; i < array.length; i++) {
    sum += array[i];
  }
  
 sum=sum%5;
  
 if(sum==0){return 0;}
   else if(sum==1){return 1;}
   else if(sum==2){ return 2;}
   else if(sum==4){return 3;}
   else{return 4;}

}
   
   
   
//ブロックの余りを数える
int record2(int array[]){
  int sum=0;
  for(int i=0;i<array.length;i++){
    sum += array[i];
  }
  return sum;
}
    
   
    
//余りを21種類に種別する
int record3(){
  int sum=record2(block);
  
  return sum%22;
  
}


int record4(){
  //ハウス判定に使う
  int sum =record2(block);
  
  return sum%12;
  
}


//float timer(){
  //float =time

  
