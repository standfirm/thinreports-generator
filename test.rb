require 'bundler'
require 'pathname'

Bundler.require
require_relative 'lib/thinreports'

ROOT = Pathname.new File.expand_path('..', __FILE__)

params = {
  type: :section,
  layout: 'test.tlf',
  params: {
    start_page_number: 1,
    groups: [
      {
        headers: {
          'document-header': {
            items: {
              'header-dynamic-text': {
                value: 'ここはドキュメントヘッダーです' * 3,
                styles: {
                  color: '#00ffff',
                  bold: true
                }
              },
              'header-line': {
                styles: {
                  border_color: '#ff0000',
                  border_width: 30
                }
              }
            }
          },
          'page-header': {
            items: {
              'header-image-block': {
                value: ROOT.join('examples/dynamic_image/img50x50.png'),
                styles: {
                  visible: false
                }
              },
              'header-image': {
                styles: {
                  visible: false
                }
              },
              'header-rect': {
                styles: {
                  border_color: '#00ff00',
                  border_width: 10,
                }
              },
              'header-ellipse': {
                styles: {
                  border_color: 'red',
                  border_width: 10,
                }
              },
              'static-text': {
                styles: {
                  color: '#ffffff'
                }
              }
            }
          }
        },
        details: (1...11).map{|i| {
              id: :detail,
              items: {
                text: "ここは明細#{i}です。ここは明細#{i}です。ここは明細#{i}です。ここは明細#{i}です。"
              }
            }
          } + [
            {
              id: :detail2,
              items: {
                text: "detail2\ndetail2\ndetail2"
              }
            }
          ],
        footers: {
          'summary-1': {
            items: {
              text: 'ここは合計部1です'
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
          },
          'notes': {
            items: {
              text: 'ここは備考1234です'
            }
          },
          'fixed-page-footer': {
            items: {
              text: 'ここは下部固定ページフッターです'
            }
          }
        }
      }
    ]
  }
}
Thinreports.generate(params, filename: 'test.pdf')
