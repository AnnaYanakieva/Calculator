require_relative '../../pages/calculator'

Given(/^I am on the calorie calculator page$/) do
  @calculator = Calculator.new
  @calculator.load
end

And(/^I enter age "([^"]*)"$/) do |age|
  @calculator.enter_age(age)
end

And(/^I enter "([^"]*)" as gender$/) do |gender|
  @calculator.select_gender(gender)
end

When(/^I insert value "([^"]*)" for weight in "([^"]*)"$/) do |weight, measurement|
  @calculator.enter_weight(weight, measurement)
end

And(/^I click on the Calculate button$/) do
  @calculator.calculate_button.click
end

And(/^I enter "([^"]*)" "([^"]*)"$/) do |height, unit|
  @calculator.enter_height(height, unit)
end

And(/^I select "([^"]*)" for exercise level$/) do |option|
  @calculator.select_exercise_level(option)
end

Then(/^I should see the error message "([^"]*)"$/) do |error_message|
  expect(@calculator).to have_content error_message
end


Then(/^I should see information about maintenance, fat_loss and extreme_fat_loss$/) do
  expect(@calculator).to have_selector('div[id="printArea"]', visible: true)
end

=begin
Then(/^I should see maintenance: "([^"]*)", fat loss: "([^"]*)" and extreme fat loss: "([^"]*)"$/) do |maintenance, fat_loss, extreme_fat_loss|
  puts "Actual maintenance: #{@calculator.maintenance.text}"
  puts "Lose: #{@calculator.fat_loss.text}"
  puts "Expected #{maintenance.to_i}"
  expect(@calculator_page).to have_xpath("//div[@id='printAreainset']", visible: true)
  expect(@calculator.maintenance.text.to_s.chomp).to eq(maintenance.to_s)
end
#: "1637", fat loss: "1309", extreme fat loss: "1144"
=end