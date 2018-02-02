@TEST-SUITE @FEATURE
Feature: Verify values on values page

@VERIFY-VALUES
Scenario: Verify that values are present and are correctly formatted
  Given I am at the values page
  And the page has completely loaded
  Then the number of values on the page should equal "5"
  And each of the values should be a number greater than zero
  And each value should be formatted as a currency

@VERIFY-TOTAL
Scenario: Verify the total balance matches the sum of the values
  Given I am at the values page
  And the page has completely loaded
  When I sum up the total of all values
  Then the sum total should be equal to the total balance shown
