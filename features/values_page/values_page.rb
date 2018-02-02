class ValuesPage < BrowserWindow

  def open
    unless @browser.url == "http://www.excercise1.com/values"
      @browser.goto("http://www.excercise1.com/values")
    end
  end

  def loaded?
    #wait for total to load, based on assumption that total loads last
    Watir::Wait.until { @browser.div(id: "txt_ttl_val").exists? }
  end

  def get_number_of_values
    @browser.spans(id: /lbl_val_/).length.to_s
  end

  def get_values
    @browser.spans(id: /txt_val_/).map &:text
  end

  def remove_currency_symbols number
    #removes anything not a number or a period
    number.gsub!(/[^\d\.]/, '').to_f
  end

  def is_us_dollar_amount? number
    #regex format: $(any number of 3 digit groups WITH commas).(any two digits)
    number.match(/^\$[0-9]{1,3}(?:,[0-9]{3})*\.[0-9]{2}$/)
  end

  def all_values_greater_than_zero? array_of_values
    array_of_values.all? { |value| value.remove_currency_symbols > 0 }
  end

  def all_values_us_currency? array_of_values
    array_of_values.all? { |value| is_us_dollar_amount?(value) }
  end

  def sum_up_array array_of_values
    array_of_values = array_of_values.each {|value| remove_currency_symbols(value)}
    array_of_values.inject :+
  end

  def get_total_value
    @browser.span(id: "txt_ttl_val").text
  end
end
