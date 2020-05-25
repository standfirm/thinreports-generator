# frozen_string_literal: true

require 'feature_test'

class TestSectionReportBasic < FeatureTest
  def setup
    initialize_data
  end

  feature :section_report_basic do
    params = {
      type: :section,
      layout_file: template_path,
      params: {
        groups: [
          {
            headers: {},
            details: build_details,
            footers: {
              overall: {
                items: {
                  number_of_items: @items.count,
                  number_of_categories: @categories.count
                }
              }
            }
          }
        ]
      }
    }
    assert_pdf Thinreports.generate(params)
  end

  private

  def build_details
    @categories.each_with_object([]) do |category, details|
      # Add category row
      details << {
        id: 'item_category',
        items: {
          category_name: category
        }
      }
      category_items = @items.select { |item| item.category == category }
      category_items.each do |item|
        # Add item row
        details << {
          id: 'item_detail',
          items: {
            item_name: item.name,
            item_unit_price: item.unit_price
          }
        }
      end
    end
  end

  Item = Struct.new(:name, :unit_price, :category)

  def initialize_data
    @categories = [
      'Beauty',
      'Garden',
      'Tools & Games'
    ]

    @items = []

    # Prepare items in the "Beauty" category
    @items << [
      ['Synergistic Rubber Bag', '1654.0'],
      ['Incredible Bronze Shirt', '4369.0'],
      ['Aerodynamic Wool Gloves', '9254.0'],
      ['Fantastic Iron Pants', '597.0'],
      ['Fantastic Marble Clock', '3489.0'],
      ['Mediocre Steel Watch', '5147.0'],
      ['Gorgeous Granite Plate', '792.0'],
    ].map { |item| Item.new(*item, 'Beauty') }

    # Prepare items in the "Garden" category
    @items << [
      ['Intelligent Linen Coat', '8706.0'],
      ['Sleek Copper Chair', '6810.0']
    ].map { |item| Item.new(*item, 'Garden') }

    # Prepare items in the "Tools & Games" category
    @items << [
      ['Small Granite Clock', '6731.0'],
      ['Aerodynamic Leather Bag', '6238.0'],
      ['Fantastic Rubber Hat', '6198.0'],
      ['Aerodynamic Marble Shoes', '9603.0']
    ].map { |item| Item.new(*item, 'Tools & Games') }

    @items.flatten!
  end
end



