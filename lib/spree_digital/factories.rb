FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_digital/factories'

  factory :digital, :class => Spree::Digital do |f|
    # TODO good to assign variant association if no association is manually defined
    # f.variant { |p| p.association(:variant) }

    attachment_content_type 'application/octet-stream'
    attachment_file_name 'a_great_book.epub'
  end

  factory :digital_link, :class => Spree::DigitalLink do |f|
    f.digital { |p| p.association(:digital) }
    f.line_item { |p| p.association(:line_item) }
  end

  factory :digital_shipping_calculator, class: Spree::Calculator::DigitalDelivery do |c|
    after(:create) { |c| c.set_preference(:amount, 0) }
  end

  factory :digital_shipping_method, parent: :shipping_method do |f|
    name "Digital Delivery"
    calculator { FactoryGirl.build :digital_shipping_calculator }
  end
end
