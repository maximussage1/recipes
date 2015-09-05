require 'test_helper'
class RecipeTest < ActiveSupport::TestCase
  
  
  def setup
    @chef = Chef.create(chefname:"Bob", email:"bob@example.com")
    @recipe = @chef.recipes.build(name: "Quesadilla", summary: "The Best recipe of quesadillas ever", description: "Just add a cheese in a Tortilla")
  end
  
  
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "Chef ID must be present" do
    @recipe.chef_id = nil
    assert_not @chef.valid?
  end
  
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name length should not be too short" do
    @recipe.name = "a"
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
    
  end
  
  test "description length should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
    
    
  end
  
  
  test "description length should not be too short" do
    @recipe.description = "a"
    assert_not @recipe.valid?
    
  end
  
end