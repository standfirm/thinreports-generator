# frozen_string_literal: true

module Thinreports
  module Generator
    class PDF
      module DrawShape
        # @param [Thinreports::Core::Shape::TextBlock::Internal] shape
        def draw_shape_tblock(shape, dheight = 0)
          x, y, w, h = shape.format.attributes.values_at('x', 'y', 'width', 'height')

          content = shape.real_value.to_s
          return if content.empty?

          attrs = build_text_attributes(shape.style.finalized_styles)

          unless shape.multiple?
            content = content.tr("\n", ' ')
            attrs[:single] = true
          end

          draw_height = h + dheight

          if attrs[:overflow] == :expand
            # The height is forcefully expanded to the bounds bottom if `overflow: expand`
            attrs = attrs.merge(overflow: :truncate)
            draw_height = [draw_height, tblock_text_height(shape)].max
          end

          text_box(content, x, y, w, draw_height, attrs)
        end

        def tblock_text_height(shape)
          result = shape.format.attributes['height']
          call_with_shape_tblock(shape) {|array, options|
            page_height = 100_000_000
            modified_options = options.merge(at: [0, page_height], height: page_height)
            result = [result, pdf.height_of_formatted(array, modified_options)].max
          }
          result
        end

        def call_with_shape_tblock(shape, dheight = 0, &block)
          raise ArgumentError unless block_given?

          x, y, w, h = shape.format.attributes.values_at('x', 'y', 'width', 'height')

          content = shape.real_value.to_s
          return if content.empty?

          attrs = build_text_attributes(shape.style.finalized_styles)

          unless shape.multiple?
            content = content.tr("\n", ' ')
            attrs[:single] = true
          end

          text_box(content, x, y, w, h + dheight, attrs, &block)
        end

        def draw_shape_pageno(shape, page_no, page_count)
          x, y, w, h = shape.format.attributes.values_at('x', 'y', 'width', 'height')

          attrs = build_text_attributes(shape.style.finalized_styles)
          text_box(shape.build_format(page_no, page_count), x, y, w, h, attrs)
        end

        # @param [Thinreports::Core::Shape::Basic::Internal] shape
        def draw_shape_image(shape)
          x, y, w, h = shape.format.attributes.values_at('x', 'y', 'width', 'height')

          image_data = shape.format.attributes['data']
          base64image(image_data['base64'], x, y, w, h)
        end

        # @param [Thinreports::Core::Shape::ImageBlock::Internal] shape
        def draw_shape_iblock(shape)
          return if blank_value?(shape.src)

          x, y, w, h = shape.format.attributes.values_at('x', 'y', 'width', 'height')
          style = shape.style.finalized_styles

          image_box(
            shape.src, x, y, w, h,
            position_x: image_position_x(style['position-x']),
            position_y: image_position_y(style['position-y']),
            offset_x: style['offset-x'],
            offset_y: style['offset-y']
          )
        end

        def shape_iblock_dimenions(shape)
          return nil if blank_value?(shape.src)

          x, y, w, h = shape.format.attributes.values_at('x', 'y', 'width', 'height')
          style = shape.style.finalized_styles

          image_dimensions(
            shape.src, x, y, w, h,
            position_x: image_position_x(style['position-x']),
            position_y: image_position_y(style['position-y'])
          )
        end

        # @param [Thinreports::Core::Shape::Text::Internal] shape
        def draw_shape_text(shape, dheight = 0)
          x, y, w, h = shape.format.attributes.values_at('x', 'y', 'width', 'height')
          text(
            shape.texts.join("\n"), x, y, w, h + dheight,
            build_text_attributes(shape.style.finalized_styles)
          )
        end

        # @param [Thinreports::Core::Shape::Basic::Internal] shape
        def draw_shape_ellipse(shape)
          cx, cy, rx, ry = shape.format.attributes.values_at('cx', 'cy', 'rx', 'ry')
          ellipse(cx, cy, rx, ry, build_graphic_attributes(shape.style.finalized_styles))
        end

        # @param [Thinreports::Core::Shape::Basic::Internal] shape
        def draw_shape_line(shape, dy1 = 0, dy2 = 0)
          x1, y1, x2, y2 = shape.format.attributes.values_at('x1', 'y1', 'x2', 'y2')
          line(x1, y1 + dy1, x2, y2 + dy2, build_graphic_attributes(shape.style.finalized_styles))
        end

        # @param [Thinreports::Core::Shape::Basic::Internal] shape
        def draw_shape_rect(shape, dheight = 0)
          x, y, w, h = shape.format.attributes.values_at('x', 'y', 'width', 'height')
          rect_attributes = build_graphic_attributes(shape.style.finalized_styles) do |attrs|
            attrs[:radius] = shape.format.attributes['border-radius']
          end
          rect(x, y, w, h + dheight, rect_attributes)
        end
      end
    end
  end
end
