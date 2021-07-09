require 'rails_helper'
RSpec.describe Task, type: :model do
  it "is valid with a name, details" do
    task = Task.new(
        name: "Name B",
        details:"Details B"
    )
    expect(task).to be_valid 
  end
  it "is invalid without a name" do
    task = Task.new(
        name: "",
        details:"Details B"
    )
    expect(task).to be_invalid
  end

  it "is valid without a details" do
    task = Task.new(
        name: "NameB",
        details:""
    )
    expect(task).to be_valid
  end

end