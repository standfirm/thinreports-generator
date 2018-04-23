# frozen_string_literal: true

example :stack_view_in_section_report, 'stack view in section report' do |t|
  params = {
    type: :section,
    layout_file: t.resource('stack_view_in_section_report.tlf'),
    params: {
      start_page_number: 1,
      groups: [
        {
          headers: {
            "document-header": {
              items: {
                stack_view_left: {
                  rows: {
                    row1: {
                      items: {
                        test_text: "row 1\n" * 15
                      }
                    },
                    row2: {
                      items: {
                        test_text: "row 2",
                      child_image: t.resource('img50x50.png')
                      }
                    },
                    row3: {
                      display: false
                    },
                    row4: {
                      items: {
                        test_text: "row 4\n" * 3
                      }
                    }
                  }
                },
                stack_view_right: {
                  rows: {
                    top_row: {
                      items: {
                        test_text: 'top row'
                      }
                    },
                    bottom_row: {
                      items: {
                        test_text: 'bottom row'
                      }
                    }
                  }
                }
              }
            }
          }
        }
      ]
    }
  }
  Thinreports.generate(params, filename: t.resource('stack_view_in_section_report.pdf'))
end
