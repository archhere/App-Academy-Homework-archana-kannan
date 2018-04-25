require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "ting") }
  subject(:icecream) {Dessert.new('icecream', 20,chef)}
  subject(:cookie) {Dessert.new('chocochip',30,chef)}


  describe "#initialize" do
    it "sets a type" do
      expect(icecream.type).to eq('icecream')
    end

    it "sets a quantity" do
      expect(icecream.quantity).to eq(20)
    end

    it "starts ingredients as an empty array" do
    expect(icecream.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {icecream.quantity('twenty')}.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      # expect (icecream.ingredients).to_not include ('coco')
      icecream.add_ingredient("cocoa")
      expect(icecream.ingredients).to include("cocoa")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cookie.add_ingredient("sugar")
      cookie.add_ingredient("butter")
      cookie.add_ingredient("flour")
      arr = ["sugar","butter","flour"]
      expect(cookie.ingredients). to eq(arr)
      cookie.mix!
      expect(cookie.ingredients.sort).to eq(arr.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookie.eat(10)
      expect(cookie.quantity).to eq(20)

    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookie.eat(50)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Ting the great baker")
      expect(cookie.serve).to eq("Chef Ting the great baker has made 30 chocochips!")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end
  end
end
