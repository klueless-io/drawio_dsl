# frozen_string_literal: true

module DrawioDsl
  module DrawIoExtensionsActive
    def apply_active_flags
      sections.each do |section|
        section[:shapes].each do |shape|
          shape[:active] = check_if_active(shape)
        end
        section[:active] = section[:shapes].any? { |s| s[:active] }
      end
    end

    def check_if_active(shape)
      style = shape[:style]

      ban = %w[
        mxCompositeShape
        strokeColor=none;fillColor=none
        shape=image
        shadow=1
        shape=partialRectangle;right=0
        shape=partialRectangle;right=0;left=0
      ]

      return false if style.empty?
      return false if ban.include?(style)

      true
    end
  end
end
