# TextBlock Vertical-align Support

SectionReport 形式の text-block は `overflow: expand` のときの縦揃え(中央、下揃え)をサポート。

- [Example code](test_section_report_text_block_vertical_align.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)

通常の形式の text-block は、`overflow: expand` で縦位置が中央又は下揃えのとき意図通りに描画されない。これは prawn の仕様によるものである。

SectionReport 形式では、これを独自にサポートしている。
