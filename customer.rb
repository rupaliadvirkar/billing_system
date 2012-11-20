class Customer < User
  def initialize(p_created_at=Time.now)
  	super(p_created_at)    
  end

  def net_amount_payable(items)
  	if is_customer_and_for_over_2yrs? 
      super(CUSTOME_FOR_2_YRS_DISCOUNT_IN_PERCENTAGE,items)
    else
      super
    end
  end

  #This method will return whether user is customer from last 2 yrs or not
  def is_customer_and_for_over_2yrs?
    (Time.now - created_at) >= (2*365*24*60*60)
  end
end
