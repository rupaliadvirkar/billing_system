class Employee < User  
  def net_amount_payable(items)
    super(EMPLOYEE_DISCOUNT_IN_PERCENTAGE,items)
  end
end
