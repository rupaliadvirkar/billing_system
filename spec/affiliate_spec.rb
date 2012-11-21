require 'spec_helper'

describe Affiliate do
  before (:all) do
  	@items  = []
    @items << Item.new('G',50.50)
    @items << Item.new('G',100)
    @items << Item.new('NG',75)
    @items << Item.new('NG',500)
    @items << Item.new('G', 750)
    @items << Item.new('misc',145)
    @affiliate = Affiliate.new()
  end

  describe "#net_amount_payable(@items)" do
    context "when valid" do
      specify{@affiliate.net_amount_payable(@items).should == 1473.5}
      specify{@affiliate.net_amount_payable([]).should == 0.0}
    end
    context "when invalid" do      
      specify{lambda{@affiliate.net_amount_payable(nil)}.should raise_error}
    end
  end  
end