# frozen_string_literal: true

require 'feature_test'

class TestSectionReportStackViewRowBottomMargin < FeatureTest
  feature :section_report_stack_view_row_bottom_margin do
    params = {
      type: :section,
      layout_file: template_path,
      params: {
        start_page_number: 1,
        groups: [
          {
            headers: {
              header: {
                items: {
                  stackview: {
                    rows: {
                      row1: {
                        items: {
                          textblock: 'long ' * 19 + 'text'
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
