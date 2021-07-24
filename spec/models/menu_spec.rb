# require 'rails_helper'
#
# RSpec.describe Menu, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
require "rails_helper"

RSpec.describe Menu, type: :model do
  subject { Order.new(menu_name: "pizza", menu_type: "Cheese", size: "large", price: 13, order: FactoryBot.create(:order)) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a order" do
    subject.order = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a menu_name" do
    subject.menu_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a menu_type" do
    subject.menu_type = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a size" do
    subject.size = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the price is not all digits" do
    subject.price = "a"
    expect(subject).to_not be_valid
  end
end
