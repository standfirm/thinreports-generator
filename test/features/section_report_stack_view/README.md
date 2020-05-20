# StackView

StackView は、複数の rows を縦に積み重ねたレイアウトマネージャです。

- [Example code](test_section_report_stack_view.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)

StackView の主な機能は以下の通りです。

- row は、その中に items を配置できるコンテナです。section に似ています
- row を非表示にすることができます。非表示にした row に続く rows は、上にスライドして表示されます
- StackView の row の中に、さらに入れ子の StackView を配置することはできません
