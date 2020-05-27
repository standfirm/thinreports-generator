# Section Bottom Margin

section の下余白（bottom margin）とは、section に配置された items の下端と、section の下端との間の距離である。

- [Example code](test_section_report_section_auto_stretch.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)


要素の種類が `background` である items は、下余白には影響しない。

<img src="bottom-margin-diagram-1.svg" />

上図の例の場合、item3 は要素の種類が `background` なので、下余白には影響しない。
item1 の下端よりも item2 の下端の方が下にあるため、item2 の下端と section の下端の間の距離が、この section の下余白となる。

section の自動伸縮が有効のときは、section の下余白を保った状態でsectionが自動的に伸縮する。詳細は [こちら](../section_report_section_auto_stretch/README.md) を参照
