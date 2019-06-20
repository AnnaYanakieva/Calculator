require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/session'
require 'capybara/dsl'
require_relative '../../lib/instance_creator'
require 'yaml'

World(InstanceCreator)

config = InstanceCreator.config

Capybara.app_host = config['url']


Capybara.default_driver = :selenium