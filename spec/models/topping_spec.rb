# require 'rails_helper'
#
# RSpec.describe Topping, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
require "rails_helper"

RSpec.describe Topping, type: :model do
  subject { Topping.new(topping_name: "Black Olives", topping_price: 1, menu: FactoryBot.create(:menu)) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a menu" do
    subject.menu = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a topping_name" do
    subject.topping_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.topping_price = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the price is not all digits" do
    subject.topping_price = "a"
    expect(subject).to_not be_valid
  end
end
