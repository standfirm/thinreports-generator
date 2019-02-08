# frozen_string_literal: true

require 'feature_test'

class TestSectionReport < FeatureTest
  feature :section_report do
    params = {
      type: :section,
      layout_file: template_path,
      params: {
        start_page_number: 1,
        groups: [
          {
            headers: {
              'document-header': {
                items: {
                  text: 'ここはドキュメントヘッダーです。' * 3,
                  unknown_item: 'ignore'
                }
              },
              'page-header': {
                items: {
                  image: path_of('img50x50.png'),
                  text: 'ここはページヘッダーです。' * 10
                }
              }
            },
            details: (1...11).map { |i| {
              id: :detail,
              items: {
                text: "ここは明細#{i}です。ここは明細#{i}です。ここは明細#{i}です。ここは明細#{i}です。",
                unknown_item: 'ignore'
              }
            }
            } + [
              {
                id: :detail2,
                items: {
                  text: "detail2\ndetail2\ndetail2"
                }
              }
            ] + [
              id: :detail3,
              items: {
                text1: -> (context) {
                  text3 = context.parent_schema.items.find { |item| item.id == 'text3' }
                  { value: "font-size:#{text3.attributes.dig('style', 'font-size')}" }
                },
                text2: "foo",
                text3: "foobar"
              }
            ] + [
              id: :detail3,
              min_height: 150,
              items: {
                text1: "bar",
                text2: "foo",
                text3: "foobar"
              }
            ] + [
              id: :detail3,
              min_height: 150,
              items: {
                text1: "bar\n" * 10,
                text2: "foo",
                text3: "foobar"
              }
            ],
            footers: {
              'summary-1': {
                items: {
                  text: 'ここは合計部1です',
                  unknown_item: 'ignore'
                }
              },
              'summary-2': {
                display: false,
                items: {
                  text: 'ここは合計部2です'
                }
              },
              'summary-3': {
                items: {
                  text: 'ここは合計部3です' * 3
                }
              }
            }
          }
        ]
      }
    }
    assert_pdf Thinreports.generate(params)
  end
end
