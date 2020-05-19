# Multiple Groups

groups parameter に複数の groups を渡すことにより、
同じ template file を使った複数回の出力を連結した、単一のPDFを生成できる。

- [Example code](test_section_report_multiple_groups.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)

## Notes

- group が終わる度に、改ページされる
- everypage が false である header は、各groupが始まる度に出力される

