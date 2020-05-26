# Section Auto Stretch

section の自動伸縮を有効にすることで、描画時の内容に応じて section の高さを自動的に伸縮させることができる。

- [Example code](test_section_report_section_auto_stretch.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)

section の自動伸縮が有効のとき、itemの高さの伸縮に応じて、sectionの高さが自動的に伸縮する。
詳細は [こちら](../section_report_section_bottom_margin/README.md) を参照

itemの高さは、それぞれ以下の条件によって描画時に伸縮する。

## 拡張

- 描画時の text-block の内容が定義した高さよりも大きい場合（text-block の溢れたときが「拡張」のときのみ）
- 描画時の stack-view の高さが定義した高さよりも大きい場合

## 縮小

- 描画時の stack-view の高さが定義した高さよりも小さい場合
- 描画時の image-block の画像が定義した高さよりも小さい場合 (image-block の縦位置が「上揃え」のときのみ)

