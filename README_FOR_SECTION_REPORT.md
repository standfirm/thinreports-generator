# SectionReport

section-report 形式は [Thinreports コミュニティの機能コンセプト](https://github.com/thinreports/thinreports/issues/7) で提案されている新しい tlf ファイルの形式です。

## Getting Started

### Prerequisites

section-report 形式の PDF を生成するためには、section-report 形式のテンプレートファイルが必要です。section-report 形式のテンプレートは [対応した Editor](https://github.com/misoca/thinreports-editor) を使って作成することができます。

### Installing

以下の行をあなたの Gemfile に追加します。

```ruby
gem 'thinreports-generator', github: 'misoca/thinreports-generator', branch: 'section-report'
```

そして、 `bundle install` を実行します。

### Generating PDF

```ruby
require 'thinreports'

params = {
  type: :section,
  layout_file: '/path/to/section-report-format-template.tlf',
  groups: [
    {
      details: [
        {
          id: :detail,
          items: {
            price: 1000
          }
        }
      ]
    }
  ]
}
Thinreports.generate(params, filename: 'sample.pdf')
```

詳細は [features/section_report_basic](test/features/section_report_basic/README.md) を参照してください。

## Examples

- [Basic Usage](test/features/section_report_basic/README.md)
- [Multiple Groups](test/features/section_report_multiple_groups/README.md)
- [Section Auto Stretch](test/features/section_report_section_auto_stretch/README.md)
- [Section Bottom Margin](test/features/section_report_section_bottom_margin/README.md)
- [Section Parameters](test/features/section_report_section_parameters/README.md)
- [Item Follow Stretch](test/features/section_report_item_follow_stretch/README.md)
- [Item Parameters](test/features/section_report_item_parameters/README.md)
- [StackView](test/features/sectiono_report_stack_view/README.md)
- [StackViewRow Auto Stretch](test/features/section_report_stack_view_row_auto_stretch/README.md)
- [StackViewRow Bottom Margin](test/features/section_report_stack_view_row_bottom_margin/README.md)
- [StackViewRow Parameters](test/features/section_report_stack_view_row_parameters/README.md)
- [StackView with Floating Item](test/features/section_report_stack_view_with_floating_item/README.md)
- [TextBlock Vertical Align](test/features/section_report_text_block_vertical_align/README.md)

## Current Status

[Thinreports コミュニティの機能コンセプト](https://github.com/thinreports/thinreports/issues/7) を基準とした実装ステータス

### Not Implemented

- フッターの「下部に固定」プロパティ
- page-number のサポート

### Additional Features

- stack-view のサポート
  - 詳細は [StackView](test/features/section_report_stack_view/README.md) を参照
- 位置の移動先を設定する `offset_x` 及び `offset_y` プロパティのサポート
  - 詳細は [Item Parameter](test/features/section_report_item_parameters/README.md) を参照
  - ただし、image-block のみサポート
- 自動拡張に加えて自動縮小のサポート (自動伸縮)
  - 詳細は [Section Auto Stretch](test/features/section_report_section_auto_stretch/README.md) と [StackViewRow Auto Stretch](test/features/section_report_stack_view_row_auto_stretch/README.md) を参照
  - ただし、image-block の定義領域の高さよりも小さな画像が指定された場合の section 又は stack-view-row の縮小は、image-block の「縦位置」プロパティが「上揃え」の場合のみサポート
- section の高さが伸縮したときに item の高さ又は上位置を自動的に変更する「伸縮に追従」プロパティのサポート
  - 詳細は [Item Follow Stretch](test/features/section_report_item_follow_stretch/README.md) を参照
  - ただし、一部の item は未サポート

### Known Issues

- パフォーマンスの課題
  - section 又は stack-view-row の高さ計算は重く、その計算を複数回実行している
