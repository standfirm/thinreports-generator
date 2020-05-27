# Section Bottom Margin

section の下余白（bottom margin）とは、section に配置された最も下にある item の下端と、section の下端との間の距離である。

- [Example code](test_section_report_section_auto_stretch.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)

sectionの自動伸縮が有効のとき、描画時のsectionの下余白が、設計時のsectionの下余白と一致するように、sectionの高さが自動的に伸縮する。

ただし、item の要素の種類が `background` の場合、これらの計算からその item は除外される。

描画時のitemの高さの伸縮については [こちら](../section_report_section_auto_stretch/README.md) を参照
