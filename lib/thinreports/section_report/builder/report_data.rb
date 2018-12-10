module Thinreports
  module SectionReport
    module Builder
      module ReportData
        Main = Struct.new :schema, :start_page_number, :groups
        Group = Struct.new :headers, :details, :footers
        Section = Struct.new :schema, :items, :min_height, :actual_height, :min_bottom_margin
      end
    end
  end
end
