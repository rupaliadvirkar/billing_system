require_relative 'item'
require_relative 'user'
require_relative 'employee'
require_relative 'customer'
require_relative 'affiliate'
require 'date'

begin
#It should be employee/affiliate/customer
type = ARGV[0] || nil
type = type.downcase.capitalize
type = ["Employee","Customer","Affiliate"].include?(type) ? type : "User"

#It should be date in the format 12/12/2012 (DD/MM/YYYY)
if ARGV[1]
  begin	
  	time_array = ARGV[1].split("/")
  	time_array.collect!{|d| d.strip.to_i}
  	created_at = Time.local(time_array[2],time_array[1],time_array[0])
  rescue
  	if type == "Customer"
  		puts "Invalid date input.....Date should be in DD/MM/YYYY format"  	
  	else
  		puts "Invalid date input.....It is ignored as not required for #{type}"  	
  	end	
  end
else
  created_at = Time.now
end

#Bill should be in the following format
#code Amount (Sapce seperated) and each item should start on the new line
#G is code of item ...G is grocery item.. NG is non grocery or it can be anything
bill = "G 100
G 50.50
NG 75
NG 500
G 750
misc 145"

items = []
bill_array = bill.split("\n")
for row in bill_array
  row_values = row.split(" ")
  row_values.collect!{|r| r.strip}
  items << Item.new(row_values[0],row_values[1].to_f)
end

user =  Object.const_get(type).new(created_at)
amount = user.net_amount_payable(items)
puts "==================net amount payable is #{amount}$"
rescue
end

