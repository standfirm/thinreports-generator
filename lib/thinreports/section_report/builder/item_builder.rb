require_relative 'stack_view_builder'

module Thinreports
  module SectionReport
    module Builder
      class ItemBuilder
        def initialize(item_schema, parent_schema)
          @item = Core::Shape::Interface(nil, item_schema)
          @parent_schema = parent_schema
        end

        def build(item_params)
          return item unless item_params

          params = build_params(item_params)

          item.visible(params[:display]) if params.key?(:display)
          item.value(params[:value]) if params.key?(:value)
          item.styles(params[:styles]) if params.key?(:styles)

          if item.internal.format.attributes['type'] == Core::Shape::StackView::TYPE_NAME
            StackViewBuilder.new(item).update(params)
          end

          item
        end

        private

        attr_reader :item, :parent_schema

        def build_params(params)
          case params
          when Hash
            params
          when Proc
            params.call(parent_schema)
          else
            { value: params }
          end
        end
      end
    end
  end
end
