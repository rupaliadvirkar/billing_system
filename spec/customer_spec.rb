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
    @customer = Customer.new()
  end  

  describe "#net_amount_payable(@items)" do
    context "when customer for less than 2 years" do
      context "when valid" do
       specify{@customer.net_amount_payable(@items).should == 1540.5}
       specify{@customer.net_amount_payable([]).should == 0.0}
      end
      context "when invalid" do      
       specify{lambda{@customer.net_amount_payable(nil)}.should raise_error}
      end    
    end

    context "when customer for over 2 years" do
     before {@customer.created_at = Time.local(2000,"jan",1,20,15,1)}
      context "when valid" do
       specify {@customer.net_amount_payable(@items).should == 1509.5}
       specify{@customer.net_amount_payable([]).should == 0.0}
      end  
      context "when invalid" do      
       specify{lambda{@customer.net_amount_payable(nil)}.should raise_error}
      end
    end 
  end  
end