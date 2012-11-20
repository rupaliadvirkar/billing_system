require 'spec_helper'

describe User do
  before (:all) do
  	@items  = []
    @items << Item.new('G',50.50)
    @items << Item.new('G',100)
    @items << Item.new('NG',75)
    @items << Item.new('NG',500)
    @items << Item.new('G', 750)
    @items << Item.new('misc',145)
  end 
  
  before (:each) do
  	@user = User.new()
  end
    	
  it "should retrun net payable amount for the bill"	do
  	@user.net_amount_payable(@items).should == 1540.5
  end
end