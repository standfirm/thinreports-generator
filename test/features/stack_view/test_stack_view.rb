# frozen_string_literal: true

require 'feature_test'

class TestStackView < FeatureTest
  feature :stack_view do
    params = {
      type: :section,
      layout_file: template_path,
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
                          test_text: -> (context) {
                            image = context.parent_schema.items.find { |item| item.id == 'child_image' }
                            { value: "width:#{image.attributes['width']}" }
                          },
                          child_image: {
                            value: path_of('img50x50.png'),
                            styles: {
                              offset_x: -20
                            }
                          }
                        }
                      },
                      row3: {
                        display: false
                      },
                      row4: {
                        items: {
                          test_text: "row 4\n" * 3
                        }
                      },
                      row5: {
                        items: {
                          child_image: path_of('1200x200.png')
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
    assert_pdf Thinreports.generate(params)
  end
end
