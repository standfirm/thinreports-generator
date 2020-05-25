# StackView

StackView によって複数の rows を縦に積み重ねたレイアウトを作ることができる。

- [Example code](test_section_report_stack_view.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)

StackView の主な機能は以下の通り。

- row は、section 同様、四角形やテキストなどの item をその中にを配置できる
- row はパラメータで動的に非表示にすることも可能。非表示にした row に続く rows は、上にスライドして表示される
- StackView の row の中に、さらに入れ子の StackView を配置することはできない
