# Section Auto Stretch

自動伸縮を有効にすることで、描画後の内容に応じて section の高さを自動的に伸縮させることができる。

- [Example code](test_section_report_section_auto_stretch.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)

section の自動伸縮が有効のとき、高さの伸縮はそれぞれ以下の条件によって発生する。

## 拡張

- 描画後の text-block の内容が section を溢れる場合
- 描画後の stack-view の内容が section を溢れる場合

## 縮小

- 描画後の stack-view の高さが定義した高さよりも小さい場合
- 描画後の image-block の画像が定義した高さよりも小さい場合 (image-block の縦位置が「上揃え」のときのみ)
