# Tarot-App
- はじめてのプログラミング、Processing
- 授業で提出したもの
- ReadMeは2023/7/27更新

<br>

## ReadMe目次
<ol>
  <li><a href="https://github.com/mickylan2367/tarot-app.git#初めの画面">初めの画面</a></li>
  <li><a href="https://github.com/mickylan2367/tarot-app.git#ゲーム画面(Aries Stage)">ゲーム画面</a></li>
  <ol>
    <li><a href="https://github.com/mickylan2367/tarot-app.git#描画されているもの">描画されているもの</a></li>
    <li><a href="https://github.com/mickylan2367/tarot-app.git#遊び方">遊び方</a></li>
  </ol>
  <li><a href="https://github.com/mickylan2367/tarot-app.git#反省点">反省点(改善したいところ)</a></li>
</ol>

<br>

## 初めの画面
<p align="center">
  <img src="https://user-images.githubusercontent.com/83509964/205849716-8cabb92a-b2d3-4d51-9611-8095db814d6c.png" width="800px">
</p>

- キラキラ光りながら回るハート、
- 周りのレースみたいなものは再起の模様(本を参照)


<p align="center">
  <img src="https://user-images.githubusercontent.com/83509964/205849595-c36ce378-9c0b-4ed1-8502-b29f809dd4c7.png" width="800px">
</p>


- マウスを中心に近づけると、チョコの包装みたいな柄が現れる
- タロットカードの美しいパッケージをイメージしている。


<p align="center">
  <img src="https://user-images.githubusercontent.com/83509964/205850192-784e2164-8298-4a62-bd3e-f57602ddc913.png" width="800px">
</p>


- クリックすると、可愛いゲーム画面選択に遷移...するはずだったが、まだ牡羊座のステージしか用意できていない。
- 牡羊座のステージは落ちてくるホタル見たいなやつを消していくスタイル。
- 中心に描かれた12角形と6角形の中にマウスを入れると、画面は"Aries Stage"と書かれてチカチカ光る。

<p align="center">
  <img src="https://user-images.githubusercontent.com/83509964/205850506-28fdb8c9-2bae-471a-bfd2-a9d89b2dfa19.png" width="800px">
</p>

<br>

## ゲーム画面 (Aries Stage)

<p align="center">
  <img src="https://user-images.githubusercontent.com/83509964/205851178-d251fde2-3889-4020-b945-38e379f775a9.png" width="800px">
</p>

<br>

### 描画されているもの
描画されている模様は

- 中心の正方形(回転、拡大)
- 2つの正方形(回転、拡大)
- ハート(回転、拡大、速度は常に一定)
- 壁のランダムなチカチカ

描画されているおもちゃ
- ボール（落ちてきたり、跳ね返ったりしている丸いもの）：ランダムな速度で動く。
- ラケット（数字が書かれている丸い透明な正方形）
- 虫みたいに落ちてくるホタルみたいな物体はブロック。

### 遊び方
- ラケットははじめ、一定の高さでしか遷移しない。
- 一定時間を過ぎると、高さも自分で制御できるようになる("Move your racket!")
- ラケットは、落ちてくる弾に当たるとライフが無くなる。
    - ライフがゲームセット前に0になると占いができない("You should think again")
    - ライフはボールをラケットの中に入れると回復できる
    - 所定時間が過ぎると、ボールは止まって"Calcurating"と表示され、
    - ゲームの結果からタロットカードが表示される。

<br>

## 反省点(改善したいところ)

- コードがとっても読みにくいので改善しようにも難しい、もっと整理して書く
- ボールが当たった判定がずれているので要修正
- 課題にこだわりすぎて、全体的に処理が重い。
    - 描画する必要がある部分と、ない部分を分ける必要がある。
    - ブロック崩しの部分以外、背景なども全て動画・写真で代替できるかもしれない。
    - 携帯で実行できるぐらいお手軽なアプリにできれば最高なのに...

- 綺麗な画面は好きだけど、デザインに凝りすぎて何がしたいのか良く分からない。
- ランダムな要素が多すぎて、ゲームとしては面白みに欠ける。
- 絵が自前で用意したものではないので、著作権に引っかかる可能性がある。
  - stable diffusionとかに作ってもらおうかな...? 
- あと、今更だけどもうちょっとちゃんと授業用の報告書を書ければよかったのになって思う。
