require 'spec_helper'

describe Customer do
  before (:all) do
  	@items  = []
    @items << Item.new('G',50.50)
    @items << Item.new('G',100)
    @items << Item.new('NG',75)
    @items << Item.new('NG',500)
    @items << Item.new('G', 750)
    @items << Item.new('misc',145)
  end 	
  context "user is a customer for less than 2 years" do	
    before (:each) do
  	  @customer = Customer.new()
  	end  
  	it "should retrun net payable amount for the bill"	do
  	  @customer.net_amount_payable(@items).should == 1540.5
	end
  end	
  context "user is a customer for over 2 years" do
    before (:each) do
  	  @customer = Customer.new(Time.local(2000,"jan",1,20,15,1))
  	end  	
  	it "should retrun net payable amount for the bill"	do
  	  @customer.net_amount_payable(@items).should == 1509.5
	end
  end		
end