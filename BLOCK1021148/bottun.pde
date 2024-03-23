//page 1のgame分岐で使うよ

//うまく判定してくれなかったので、要改善
//ここも助けて…
boolean bottunAries(){
    float R = dist(mouseX,mouseY,width/2,height/2);//2点の距離を測ってくれる
    float r1 = ((height/2)-50)*2/3;
    float r2 = (height/2)-50;
    int chk=0;
    
    
    for(int degree =0; degree<=180*2; degree++){
      
       float theta = radians(degree);
    
      //牡羊座の領域にマウスがあるかどうかを判定する
      if(r1*cos(theta)< R*cos(theta) && R*cos(theta)<r2*cos(theta) && r1*sin(theta)<R*sin(theta) && R*sin(theta)<r2*cos(theta)){
        //すべて条件を満たしていれば、chkを一つずつ増やします。
        chk++;
      }
    }
    
    if(chk>=30){
      //全部正しければ、chkは30になっているはずだからtrue
      return true;
     }else{
       return false;}
    
}
