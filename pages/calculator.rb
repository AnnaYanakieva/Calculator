require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

class Calculator < SitePrism::Page
  set_url 'https://www.freedieting.com/calorie-calculator'

  element :age, '#age'
  element :female, '#sexFem'
  element :male, '#sexMale'
  element :weight, :xpath, "//input[@name='weight']"
  element :weight_pounds, :xpath, "//input[@id='weighttype1']"
  element :weight_kilos, :xpath, "//input[@id='weighttype2']"
  element :error_message_weight, :xpath, "//span[@id='weighterror']/span"
  element :calculate_button, :xpath, '//div[@class="space-top-large"]/input'
  element :feet_inches_radio_button, '#heightFeet'
  element :feet_input, :xpath, '//input[@id="feet"]'
  element :inches_input, :xpath, '//input[@id="inches"]'
  element :cms_radio_button, '#heightCM'
  element :cm_input, :xpath, '//input[@id="cm"]'
  element :exercise_level_dropdown, :xpath, '//select[@id="activity"]'
  element :result_total_calories, 'div[id="printArea"][style="display: block;"]'
  element :maintenance, 'span#answer'
  element :fat_loss, '#lose'
  element :extreme_fat_loss, '#loseExt'
  element :age_error, '#ageerror .tip'


  def enter_age(age)
    self.age.set age
  end

  def select_gender(gender)
    if (gender.downcase == "female")
      self.female.click

    elsif (gender.downcase == "male")
      self.male.click
    end
  end

  def enter_weight(weight, measurement)
    self.weight.set weight

    if (measurement.downcase == "pounds")
      self.weight_pounds.click

    elsif (measurement.downcase == "kilos")
      self.weight_kilos.click
    end
  end

  def enter_height(height, unit)
    if (unit.downcase == "feet & inches")
      self.feet_inches_radio_button.click
      self.feet_input.set height
    elsif (unit.downcase == "cms")
      self.cms_radio_button.click
      self.cm_input.set height
    end
  end

  def select_exercise_level(option)
    #find(self.exercise_level_dropdown).find(:xpath, "option[value='1.2']").select_option
    select "#{option}", :from => 'activity'
  end
end


