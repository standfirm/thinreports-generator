# ContentType Float

要素の種類が `float` である item を、stack-view の row に配置すると、item を row から下にはみ出させることができる。

- [Example code](test_section_report_content_type_float.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)

要素の種類が `float` である item は、下余白の計算には影響するが、コンテンツの下位置の計算では無視される。
このため、要素の種類が `float` である item は、row から下にはみ出す場合がある。

要素の種類が `float` である item が、row を積み重ねた高さよりも下にはみ出す場合には、stack-view の高さがその分拡張する。

row の伸縮の仕様は、[StackViewRow Auto Stretch](../section_report_stack_view_row_auto_stretch/README.md) を参照。
