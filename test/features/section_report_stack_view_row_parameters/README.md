# StackViewRow Parameter

row の定義時のプロパティはパラメータで変更することができる。

- [Example code](test_section_report_stack_view_row_parameters.rb)
- [Example template file](template.tlf)
- [Example PDF](expect.pdf)

## 表示

`display` プロパティで表示または非表示にすることができる。

```
row_id: {
  display: Boolean
}
```

## 最小の高さ

`min_height` プロパティで row の描画時の最小の高さを指定することができる。

```
row_id: {
  min_height: Number
}
