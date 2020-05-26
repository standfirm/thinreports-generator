# Section Bottom Margin

下余白とは、item の下端と section の下端との距離である。

- [Example code](test_section_report_section_auto_stretch.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)

sectionに配置された各itemの下余白の中で最小のものを、sectionの最小下余白と呼ぶ。

sectionの自動伸縮が有効のとき、設計時の最小下余白と、描画時の最小下余白が一致するように、sectionの高さが自動的に伸縮する。

ただし、item の要素の種類が `background` の場合、これらの計算からその item は除外される。

描画時のitemの高さの伸縮については [こちら](../section_report_section_auto_stretch/README.md) を参照
