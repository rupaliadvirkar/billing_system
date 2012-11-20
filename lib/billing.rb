#This is billing logic library
module Billing

 #This method will return the net amount payable after all the calculations done. 
 def calculate_net_amount_payable(predefined_discount_percentage,items)
  total_bill_amount = total_bill_amount_without_discount(items)
  bill_amount_with_percentage_discount = total_bill_amount - discount_based_on_percentage(predefined_discount_percentage,amount_eligible_for_percentage_discount(items))
  net_amount_payable = bill_amount_with_percentage_discount - misc_discount(bill_amount_with_percentage_discount)  
 end	

 #This method will return total amount of the bill without discount 
 def total_bill_amount_without_discount(items)
   amount = 0.0 
   items.collect{|item| amount += item.amount}
   amount
 end

#This method will return misc discount on the total bill amount
 def misc_discount(total_amount_payable)
	(total_amount_payable / MISC_BILL_AMNT_IN_DOLLER).to_i * 5
 end	

 #This method will return amount eligible for the discount after removing grocery item 
 def amount_eligible_for_percentage_discount(items)
  total_bill_amount_without_discount(items) - grocery_items_amount(items)
 end

 #This method will return amount of all grocery items 
 def grocery_items_amount(items)
  amount = 0.0
  items.collect{|item| amount += item.amount if item.is_grocery?}
  amount
 end

 #This method will return final discount amount on the basis of predefined discount and total eligibal amount
 def discount_based_on_percentage(predefined_discount_percentage,amount)
  predefined_discount_percentage ? (amount * predefined_discount_percentage) / 100 : 0
 end

end