# require 'rails_helper'
#
# RSpec.describe Store, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
require "rails_helper"

RSpec.describe Store, type: :model do
  subject { Store.new(store_name: "Pizza Hut", store_address: "21 Georgia Ave NW, Washington, DC 20015", order_type: "delivery", menu: FactoryBot.create(:menu)) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a menu" do
    subject.menu = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a store_name" do
    subject.store_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a store_address" do
    subject.store_address = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an order_type" do
    subject.order_type = nil
    expect(subject).to_not be_valid
  end

end
