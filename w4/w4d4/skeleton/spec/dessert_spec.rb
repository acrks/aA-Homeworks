require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name:  "Gordon") }
  let(:baked_alaska) { Dessert.new("Baked Alaska", 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(baked_alaska.type).to eq("Baked Alaska")
    end
    it "sets a quantity" do
      expect(baked_alaska.quantity).to eq(50)
    end 
    it "starts ingredients as an empty array" do
      expect(baked_alaska.ingredients).to be_empty
    end 
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("Baked Alaska", "hella", chef) }.to raise_error(ArgumentError)
    end 
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      baked_alaska.add_ingredient("ice cream")
      expect(baked_alaska.ingredients).to include("ice cream")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients= ["ice cream", "vanilla extract", "cream", "chocolate", "egg"]
      (0...ingredients.length).each do |i|
        baked_alaska.add_ingredient(ingredients[i])
      end
      baked_alaska.mix!
      expect(baked_alaska.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      prev_amount = baked_alaska.quantity
      baked_alaska.eat(20)
      expect(baked_alaska.quantity).not_to eq(prev_amount)
      expect(baked_alaska.quantity).to eq(30)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect{ baked_alaska.eat(51)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Gordon the Great Baker")
      expect(baked_alaska.serve).to eq("Chef Gordon the Great Baker has made 50 Baked Alaskas!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(baked_alaska)
      baked_alaska.make_more
    end
  end
end
