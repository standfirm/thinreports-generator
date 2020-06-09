# frozen_string_literal: true

require 'feature_test'

class TestSectionReportFollowStretchHeight < FeatureTest
  feature :section_report_follow_stretch_height do
    params = {
      type: :section,
      layout_file: template_path,
      params: {
        groups: [
          {
            details: [
              {
                id: :detail_test_part_of_text_block_content_is_not_rendered,
                items: {
                  text1: 'text1' * 4,
                  text2: 'text2'
                }
              },
              {
                id: :detail_test_text_block,
                items: {
                  text_expand: 'Expand' * 5,
                  text_truncate: 'Truncate' * 7,
                  text_shrink_to_fit: 'ShrinkToFit' * 6
                }
              },
              {
                id: :detail_test_stretchable_items,
                items: {
                  text_expand: 'Expand' * 5
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
