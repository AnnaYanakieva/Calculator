Feature:
   As a end user
   I want to be able to select checkboxes for Gender, Weight and Height
   I want to input values for Age , Weight and Height
   I want to select exercise level from the “Exercise  level” drop down
   I click the “Calculate” button I see that “Total calories ” table is displayed with relevant results for “Maintainance”,   “Fat Loss” and “Extreme fat loss”

  Scenario: Display error message if the weight is incorrect
    Given I am on the calorie calculator page
    And I enter age "25"
    And I enter "female" as gender
    When I insert value "15" for weight in "KILOS"
    And I click on the Calculate button
    Then I should see the error message "Enter a valid weight"


  Scenario Outline: Show total calories
    Given I am on the calorie calculator page
    And I enter age "<age>"
    And I enter "<gender>" as gender
    When I insert value "<weight>" for weight in "<weight_unit>"
    And I enter "<height>" "<height_unit>"
    And I select "<exercise_level>" for exercise level
    And I click on the Calculate button
    Then I should see information about maintenance, fat_loss and extreme_fat_loss

  Examples:
  |age|gender|weight_unit|weight|height_unit|height|exercise_level|
  |25 |female|KILOS      |55    |cms        |160   |Little/no exercise|


  Scenario Outline: Display error message if the age is out of the range "13-80"
    Given I am on the calorie calculator page
    And I enter age "<age>"
    And I enter "<gender>" as gender
    When I insert value "<weight>" for weight in "<weight_unit>"
    And I enter "<height>" "<height_unit>"
    And I select "<exercise_level>" for exercise level
    And I click on the Calculate button
    Then I should see the error message "<age_error_message>"

    Examples:
      |age|gender|weight_unit|weight|height_unit|height|exercise_level|age_error_message|
      |2 |female|KILOS      |55    |cms        |160   |Little/no exercise|Between 13 and 80|