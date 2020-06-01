# StackView With Floating Item

item を stack-view の row から下にはみ出して配置することができる。

- [Example code](test_section_report_content_type_float.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)


item を row から下にはみ出して配置する場合には、通常、そのitemの「下余白に影響」を無効にする。
（「下余白に影響」が有効のままだと、rowの下余白が負の値になってしまい、意図しない結果となる場合がある）

rowからはみ出したitemが、stack-view の row を積み重ねた高さよりも下にはみ出す場合には、stack-view の高さがその分拡張する。

row の伸縮の仕様は、[StackViewRow Auto Stretch](../section_report_stack_view_row_auto_stretch/README.md) を参照。
