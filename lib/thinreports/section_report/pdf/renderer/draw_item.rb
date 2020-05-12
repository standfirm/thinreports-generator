# frozen_string_literal: true

module Thinreports
  module SectionReport
    module Renderer
      module DrawItem
        def draw_item(item, expanded_height = 0)
          shape = item.internal

          if shape.type_of?(Core::Shape::TextBlock::TYPE_NAME)
            case shape.format.follow_stretch
            when 'height'
              computed_height = shape.format.attributes['height'] + expanded_height

              if shape.style.finalized_styles['overflow'] == 'expand'
                # Overflow attribute is overwitten to :truncate when the follow-strecth attribute is height
                # and the overflow attribute is expand.
                pdf.draw_shape_tblock(shape, height: [computed_height, calc_text_block_height(shape)].max, overflow: :truncate)
              else
                pdf.draw_shape_tblock(shape, height: computed_height)
              end
            else
              pdf.draw_shape_tblock(shape)
            end
          elsif shape.type_of?(Core::Shape::ImageBlock::TYPE_NAME)
            pdf.draw_shape_iblock(shape)
          elsif shape.type_of?('text')
            case shape.format.follow_stretch
            when 'height'
              pdf.draw_shape_text(shape, expanded_height)
            else
              pdf.draw_shape_text(shape)
            end
          elsif shape.type_of?('image')
            pdf.draw_shape_image(shape)
          elsif shape.type_of?('ellipse')
            pdf.draw_shape_ellipse(shape)
          elsif shape.type_of?('rect')
            case shape.format.follow_stretch
            when 'height'
              pdf.draw_shape_rect(shape, expanded_height)
            else
              pdf.draw_shape_rect(shape)
            end
          elsif shape.type_of?('line')
            case shape.format.follow_stretch
            when 'height'
              y1, y2 = shape.format.attributes.values_at('y1', 'y2')
              if y1 < y2
                pdf.draw_shape_line(shape, 0, expanded_height)
              else
                pdf.draw_shape_line(shape, expanded_height, 0)
              end
            when 'y'
              pdf.draw_shape_line(shape, expanded_height, expanded_height)
            else
              pdf.draw_shape_line(shape)
            end
          elsif shape.type_of?(Core::Shape::StackView::TYPE_NAME)
            stack_view_renderer.render(shape)
          else
            puts 'unknown shape type'
          end
        end
      end
    end
  end
end
