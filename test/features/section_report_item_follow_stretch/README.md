# item の follow-stretch プロパティ

item の `follow-stretch` プロパティを指定すると、
item が配置されているコンテナ（section または stack view row）の伸縮に応じて、
item のレイアウトが変化する。

- [Example code](test_section_report_item_follow_stretch.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)


item の `follow-strech` プロパティが…
- `height` の場合: コンテナの伸縮に応じて、item の高さが伸縮する
- `y` の場合: コンテナの伸縮に応じて、item が縦にスライドする
- `none` の場合（デフォルト）: 変化なし

ただし現状では、以下の種類の item のみ、`follow-strech` プロパティをサポートする。
- `height` の場合: text block, text, rect, line のみ
- `y` の場合: line のみ
