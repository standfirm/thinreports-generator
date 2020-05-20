# frozen_string_literal: true

require 'feature_test'

class TestSectionReportStackView < FeatureTest
  feature :section_report_stack_view do
    params = {
      type: :section,
      layout_file: template_path,
      params: {
        start_page_number: 1,
        groups: [
          {
            details: [
              {
                id: :detail,
                items: {
                  stackview: {
                    rows: {
                      row1: {
                        items: {
                          text: 'Section 1'
                        }
                      }
                    }
                  }
                }
              },
              {
                id: :detail,
                items: {
                  stackview: {
                    rows: {
                      row1: {
                        items: {
                          text: 'Section 2'
                        }
                      },
                      row2: {
                        display: false
                      }
                    }
                  }
                }
              }
            ]
          }
        ]
      }
    }
    assert_pdf Thinreports.generate(params)
  end
end
