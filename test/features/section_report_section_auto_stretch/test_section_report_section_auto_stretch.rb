# frozen_string_literal: true

require 'feature_test'

class TestSectionReportSectionAutoStretch < FeatureTest
  feature :section_report_section_auto_stretch do
    params = {
      type: :section,
      layout_file: template_path,
      params: {
        groups: [
          {
            headers: {
              header: {
                items: {
                  text_overflow_expand: 'Extended text box height with long text.' * 3
                }
              }
            },
            details: [
              {
                id: 'detail1',
                items: {
                  stackview: {
                    rows: {
                      row2: {
                        items: {
                          text_overflow_expand: 'Extended text box height with long text.' * 2
                        }
                      }
                    }
                  }
                }
              },
              {
                id: 'detail2',
                items: {
                  stackview: {
                    rows: {
                      row1: {
                        display: false
                      }
                    }
                  }
                }
              }
            ],
            footers: {
              footer1: {
                items: {
                  image200x100: StringIO.new(dir.join('50x50.jpg').binread)
                }
              },
              footer2: {
                items: {
                  text_overflow_expand: 'Extended text box height with long text.' * 3
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

