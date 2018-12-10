require_relative 'stack_view_renderer'
require_relative 'section_height'
require_relative 'draw_item'

module Thinreports
  module SectionReport
    module Renderer
      class SectionRenderer
        include SectionHeight
        include DrawItem

        def initialize(pdf)
          @pdf = pdf
        end

        def render(section)
          doc = pdf.pdf

          actual_height = section_height(section)
          min_bottom_margin = min_bottom_margin(section)
          doc.bounding_box([0, doc.cursor], width: doc.bounds.width, height: actual_height) do
            section.items.each do |item|
              puts "section: #{section.schema.id}, shape: #{item.internal.id}, bottom_margin: #{item.internal.layout_info.bottom_margin}, min_bottom_margin: #{min_bottom_margin}"
              draw_item(item, actual_height - section.schema.height, item.internal.layout_info.bottom_margin - min_bottom_margin)
            end
            # doc.stroke_bounds
          end

          # After executing bounding_box method, the position of doc.cursor moves to the bottom of the box.
          # https://github.com/prawnpdf/prawn/blob/master/lib/prawn/document/bounding_box.rb#L44
        end

        private

        attr_reader :pdf

        def stack_view_renderer
          @stack_view_renderer ||= Renderer::StackViewRenderer.new(pdf)
        end
      end
    end
  end
end
