# Section Bottom Margin

section の下余白（bottom margin）とは、section に配置された items の下端と、section の下端との間の距離である。

- [Example code](test_ssection_report_section_bottom_margin.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)


要素の種類が `background` である item は、下余白には影響しない。

<img src="bottom-margin-diagram-1.svg" />

上図の例の場合、item3 は要素の種類が `background` なので、下余白には影響しない。
item1 の下端よりも item2 の下端の方が下にあるため、item2 の下端と section の下端の間の距離が、この section の下余白となる。

section の自動伸縮が有効のときは、section の下余白を保った状態で section が自動的に伸縮する。詳細は [Section Auto Stretch](../section_report_section_auto_stretch/README.md) を参照
