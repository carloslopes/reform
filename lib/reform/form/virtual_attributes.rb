module Reform
  class Form
    # TODO: this should be in Representer namespace.
    module EmptyAttributesOptions
      def options
        empty_fields = representable_attrs.
          find_all { |d| d.options[:empty] }.
          collect  { |d| d.name.to_sym }

        super.exclude!(empty_fields)
      end
    end

    module ReadonlyAttributesOptions
      def options
        readonly_fields = representable_attrs.
          find_all { |d| d.options[:virtual] }.
          collect  { |d| d.name.to_sym }

        super.exclude!(readonly_fields)
      end
    end
  end
end
