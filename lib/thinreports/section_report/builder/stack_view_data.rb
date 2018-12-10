module Thinreports
  module SectionReport
    module Builder
      module StackViewData
        Row = Struct.new :schema, :items, :min_height, :actual_height, :min_bottom_margin
      end
    end
  end
end
