require 'spec_helper'

describe Billing do
  class DummyClass
  end
  
  before(:all) do
	  @dummy = DummyClass.new
    @dummy.extend Billing
    @items  = []
    @items << Item.new('G',50.50)
    @items << Item.new('G',100)
    @items << Item.new('NG',75)
    @items << Item.new('NG',500)
    @items << Item.new('G', 750)
    @items << Item.new('misc',145)
  end
  it "should return total bill amount without any discount" do
  	@dummy.total_bill_amount_without_discount(@items).should == 1620.5
  end
  it "should return misc discount which is For every $100 on the bill, there would be a $ 5 discount" do
  	@dummy.misc_discount(1620.5).should == 80
  end
  it "should return total grocery items amount" do
  	@dummy.grocery_items_amount(@items).should == 900.5
  end
  it "should return amount eligible for percentage discount that is after removing grocery items from the bill" do
  	@dummy.amount_eligible_for_percentage_discount(@items).should == 720
  end
  describe "calculation of discount based on predefined percentage on the basis of type of user" do
  	context "when user is emplyoee" do
  	  it "should retrun discount which is 30% of the eligible amount" do
  	  	@dummy.discount_based_on_percentage(30,720).should == 216
  	  end	
    end
    context "when user is affiliate" do     	
      it "should retrun discount which is 10% of the eligible amount" do
      	@dummy.discount_based_on_percentage(10,720).should == 72
  	  end	
    end
    context "when user is customer over 2 yrs" do
      it "should retrun discount which is 5% of the eligible amount" do
      	@dummy.discount_based_on_percentage(5,720).should == 36
  	  end	
    end
    context "when user is customer for less than 2 yrs" do
      it "should return discount as zero" do
      	@dummy.discount_based_on_percentage(0,720).should == 0
      end	
    end  	 	
  end

  describe "calculation of net payable amount for a user" do
  	context "when user is emplyoee" do
  	  it "should retrun net payable amount" do
  	  	@dummy.calculate_net_amount_payable(30,@items).should == 1334.5
  	  end	
    end
    context "when user is affiliate" do     	
      it "should retrun net payable amount" do
      	@dummy.calculate_net_amount_payable(10,@items).should == 1473.5
  	  end	
    end
    context "when user is customer over 2 yrs" do
      it "should retrun net payable amount" do
      	@dummy.calculate_net_amount_payable(5,@items).should == 1509.5
  	  end	
    end
    context "when user is customer for less than 2 yrs" do
      it "should retrun net payable amount" do
      	@dummy.calculate_net_amount_payable(0,@items).should == 1540.5
      end	
    end  	 	
  end  
end