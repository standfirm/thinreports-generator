# frozen_string_literal: true

require 'feature_test'

class TestSectionReport < FeatureTest
  feature :section_report_multiple_groups do
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
                  text: 'Header of Group 1'
                }
              }
            },
            details: 20.times.map {
              {
                id: :detail,
                items: {
                  text: 'Detail of Group 1'
                }
              }
            }
          },
          {
            headers: {
              header: {
                items: {
                  text: 'Header of Group 2'
                }
              }
            },
            details: 10.times.map {
              {
                id: :detail,
                items: {
                  text: 'Detail of Group 2'
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
