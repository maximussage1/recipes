require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "John", email: "example@john.com")
    
  end
  
  test "Chef should be valid" do
    assert @chef.valid?
    
  end
  
  
  test "chefname should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  
  test "chefname should not be too long" do
  @chef.chefname = "a"*41
  assert_not @chef.valid?
  end

  test "chefname should not be too short" do
    @chef.chefname = "a"
    assert_not @chef.valid?
  end
  
  
  test "email should be present" do
    @chef.email = " " 
    assert_not @chef.valid?
  end
  
  test "email length should be on bounds" do
    @chef.email = "a"*101 + "@lupid.com"
    assert_not @chef.valid?
  end
  
  test "email should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email address validation should accept valid address" do
    valid_addresses = %w[aeb@aeb.com ASD@lol.com user@example.com lola@lolita.com]
    valid_addresses.each do |a|
      @chef.email = a
      assert @chef.valid? '#{a.inspect} should be valid'
    end
  end
  
  test "email address validation should reject invalid addresses " do
    invalid_addresses = %w[aeb@aebcom ASDlol.com user@example lolalolita.com]
    invalid_addresses.each do |i|
      @chef.email = i
      assert_not @chef.valid? '#{a.inspect} should be invalid'
    end
  end
  
  
  
end