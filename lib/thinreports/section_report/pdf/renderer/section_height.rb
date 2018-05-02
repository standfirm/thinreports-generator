module Thinreports
  module SectionReport
    module Renderer
      module SectionHeight
        LayoutInfo = Struct.new(:shape, :content_height, :top_margin, :bottom_margin)

        def section_height(section)
          return (section.min_height || section.schema.height) unless section.schema.auto_stretch? && section.items

          item_layouts = section.items.map { |item| item_layout(section, item.internal) }.compact

          min_bottom_margin =
            item_layouts
              .reject { |l| l.shape.format.content_type == :background }
              .map { |l| l.bottom_margin }
              .min.to_f

          max_content_bottom =
            item_layouts
              .select { |l| l.shape.format.content_type == :content }
              .map { |l| l.top_margin + l.content_height }
              .max.to_f

          [section.min_height || 0, max_content_bottom + min_bottom_margin].max
        end

        def calc_height_with_float_content(section)
          item_layouts = section.items.map { |item| item_layout(section, item.internal) }.compact
          item_layouts
            .select { |l| l.shape.format.content_type == :float }
            .map { |l| l.top_margin + l.content_height }
            .max.to_f
        end

        def item_layout(section, shape)
          if shape.type_of?(Core::Shape::TextBlock::TYPE_NAME)
            text_layout(section, shape)
          elsif shape.type_of?(Core::Shape::StackView::TYPE_NAME)
            stack_view_layout(section, shape)
          elsif shape.type_of?(Core::Shape::ImageBlock::TYPE_NAME)
            image_block_layout(section, shape)
          elsif shape.type_of?('ellipse')
            cy, ry = shape.format.attributes.values_at('cy', 'ry')
            static_layout(section, shape, cy - ry, ry * 2)
          elsif shape.type_of?('line')
            y1, y2 = shape.format.attributes.values_at('y1', 'y2')
            static_layout(section, shape, [y1, y2].min, (y2 - y1).abs)
          else
            y, height = shape.format.attributes.values_at('y', 'height')
            raise ArgumentError.new("Unknown layout for #{shape}") if height == nil || y == nil
            static_layout(section, shape, y, height)
          end
        end

        def static_layout(section, shape, y, height)
          LayoutInfo.new(shape, height, y, section.schema.height - height - y)
        end

        def image_block_layout(section, shape)
          y, height = shape.format.attributes.values_at('y', 'height')
          if shape.style.finalized_styles['position-y'] == 'top'
            dimensions = pdf.shape_iblock_dimenions(shape)
            content_height = dimensions ? dimensions[1] : 0

            LayoutInfo.new(shape, content_height, y, section.schema.height - height - y)
          else
            static_layout(section, shape, y, height)
          end
        end

        def text_layout(section, shape)
          y, schema_height = shape.format.attributes.values_at('y', 'height')

          content_height = schema_height
          if shape.style.finalized_styles['overflow'] == 'expand'
            pdf.draw_shape_tblock(shape) {|array, options|
              page_height = pdf.pdf.bounds.height
              modified_options = options.merge(at: [0, page_height], height: page_height)
              content_height = [content_height, pdf.pdf.height_of_formatted(array, modified_options)].max
            }
          end

          LayoutInfo.new(shape, content_height, y, section.schema.height - schema_height - y)
        end

        def stack_view_layout(section, shape)
          schema_height = 0
          shape.format.rows.each {|row| schema_height += row.attributes['height']}

          y = shape.format.attributes['y']
          LayoutInfo.new(shape, stack_view_renderer.section_height(shape), y, section.schema.height - schema_height - y)
        end
      end
    end
  end
end
