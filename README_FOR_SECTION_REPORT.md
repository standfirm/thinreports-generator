# SectionReport

## Introduction

便宜上、thinreports の tlf ファイルの元の形式を basic-report 形式と呼称します。

section-report 形式は、その basic-report 形式とは異なる新しいテンプレート形式です。これは次のような特徴を持っています。

- セクションという単位でヘッダーやフッター、繰り返し行を任意の数だけ定義することができる
- セクションを組み合わせることによって、柔軟なレイアウトの PDF を作ることができる

私たちが実装した section-report 形式の仕様は、 [Thinreports コミュニティの機能コンセプト](https://github.com/thinreports/thinreports/issues/7) をベースにしています。いくつか異なる仕様や独自に追加した仕様もありますが、[コミュニティの機能コンセプト](https://github.com/thinreports/thinreports/issues/7) は、section-report 形式の概要を知るための良い資料です。

## Our Plan

私たちは、この section-report 形式を Thinreports コミュニティに提案し、コミュニティと協力して thinreports-generator に取り込むことを目指します。

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

## Limitations & Known Issues

- item の「領域伸縮に従う」プロパティは一部の item のみサポート
  - 詳細は [Item Follow Stretch](test/features/section_report_item_follow_stretch/README.md) を参照
- image-block の定義領域の高さよりも小さな画像が指定された場合の section 又は stack-view-row の縮小は、image-block の「縦位置」プロパティが「上揃え」の場合のみサポート
  - 領域の縮小については [Section Auto Stretch](test/features/section_report_section_auto_stretch/README.md) 又は [StackViewRow Auto Stretch](test/features/section_report_stack_view_row_auto_stretch/README.md) を参照
- 位置の移動先を設定する `offset_x` 及び `offset_y` プロパティは image-block のみサポート
  - 詳細は [Item Parameter](test/features/section_report_item_parameters/README.md) を参照
