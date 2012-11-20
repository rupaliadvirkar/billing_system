require_relative 'lib/constants'
require_relative 'lib/billing'

class User
  include Billing
  attr_accessor :created_at

  def initialize(p_created_at=Time.now)
    @created_at =  p_created_at
  end  

  #This method will calculate net amount payable after all the calculations.  
  def net_amount_payable(predefined_discount_in_percentage=0,items)
    calculate_net_amount_payable(predefined_discount_in_percentage,items)
  end
end