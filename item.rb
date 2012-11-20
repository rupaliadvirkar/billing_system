require_relative 'lib/constants'

class Item
	attr_accessor :code, :amount

	#This mwthod will return whether item is of type grocery or not
	def initialize(p_code, p_amount)
	  @code = p_code
      @amount = p_amount
	end	

	def is_grocery?
		code == GROCERY_ITEM_CODE
	end	
end
