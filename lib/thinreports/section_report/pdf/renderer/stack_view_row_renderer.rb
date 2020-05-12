# frozen_string_literal: true

require_relative 'section_height'
require_relative 'draw_item'

module Thinreports
  module SectionReport
    module Renderer
      class StackViewRowRenderer
        include SectionHeight
        include DrawItem

        def initialize(pdf)
          @pdf = pdf
        end

        def render(row)
          doc = pdf.pdf

          actual_height = section_height(row)
          doc.bounding_box([0, doc.cursor], width: doc.bounds.width, height: actual_height) do
            row.items.each do |item|
              draw_item(item, (actual_height - row.schema.height))
            end
          end

          # After executing bounding_box method, the position of doc.cursor moves to the bottom of the box.
          # https://github.com/prawnpdf/prawn/blob/a8b0ceabd8fc281c62fc3a02dd2b64ee1e3b515c/lib/prawn/document/bounding_box.rb#L46
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
