module SalesHelper
  
  def pretty_amount(sale)
    if sale.amount_type.eql? "fixed"
      amount_as_currency(sale.amount, sale.shop)
    else
      number_to_percentage(sale.amount, :precision => 2)
    end
  end
  
  def amount_as_currency(amount, shop)
    fmt = shop.money_with_currency_format
    if fmt =~ /\{\{amount_no_decimals\}\}/
      fmt.gsub("{{amount_no_decimals}}", "#{amount}")
    else
      shop.money_with_currency_format.gsub("{{amount}}", pad_number(amount))
    end
  end
  
  def pad_number(number, min_decimals=2)
    s = "%g" % number
    decimals = (s[/\.(\d+)/,1] || "").length
    s << "." if decimals == 0
    s << "0"*[0,min_decimals-decimals].max
  end
  
end
