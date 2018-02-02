Given("I am at the values page") do
  @values_page = ValuesPage.new
  @values_page.open
end

Given("the page has completely loaded") do
  @values_page.loaded?
end

Then("the number of values on the page should equal {string}") do |number|
  expect(@values_page.get_number_of_values).to eq number
end

Then("each of the values should be a number greater than zero") do
  values_array = @values_page.get_values
  expect(@values_page.all_values_greater_than_zero?(values_array)).to eq true
end

Then("each value should be formatted as a currency") do
  values_array = @values_page.get_values
  expect(@values_page.all_values_us_currency?(values_array)).to eq true
end

When("I sum up the total of all values") do
  values_array = @values_page.get_values
  @values_sum = values_array.sum_up_array
end

Then("the sum total should be equal to the total balance shown") do
  total_value = @values_page.get_total_value
  expect(@values_sum).to eq total_value
end
