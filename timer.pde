

//ちょいと難しいけど、オブジェクト指向なるものに挑戦
class Timer{
  //timerの実装
  //millisが返すのは画面がスタートしてからの現在の秒数
  int savedTime;
  int totalTime;
  
  //コンストラクタなるのもを定義しておけば、objectName = new className (引数)で新たなるオブジェクトを生成することが可能になる、何という便利な機能w
  //初めからこれで書けばよかった.あれ？？？？これ、ブロックとかにも使えるじゃん
  //ということでコンストラクタがこちら
  Timer(int temporalTime){
    totalTime = temporalTime;
  }
  
  void Start(){
    //tumerをスタートさせる時の、millisの値を格納しておく。
    savedTime = millis();
  }
  
 
  int TIME(){
    int passedTime = (millis() - savedTime)/1000;
    return passedTime;
  }
  
  
  int remain(){
    int passedTime = millis() - savedTime;
    int remain = (totalTime - passedTime)/1000;
    return remain;
  } 
  
  
  boolean isfinished(){
    int passedTime = millis()-savedTime;
    
    if(passedTime> totalTime){
      return true;
    }else{
      return false;
    }
  }

}
