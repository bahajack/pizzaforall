require 'rails_helper'
RSpec.describe Customer, type: :model do
  subject { Customer.new(name: "Jack", address: "33 Georgia Ave NW, Washington, DC 20013", phone: "8889995678" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a address" do
    subject.address=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a phone number" do
    subject.phone=nil
    expect(subject).to_not be_valid
  end

  it "is not valid if the phone number is not 10 chars" do
    subject.phone="123456789"
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not all digits" do
    subject.phone="123456aaa"
    expect(subject).to_not be_valid
  end

end
