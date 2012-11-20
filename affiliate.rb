class Affiliate < User
  def net_amount_payable(items)
    super(AFFILIATE_DISCOUNT_IN_PERCENTAGE,items)
  end
end
