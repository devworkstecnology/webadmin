require 'capybara/rspec'
require 'capybara/poltergeist'

module Capybara
  class Session
    # Ignore current scopes of capybara.
    #
    # Example:
    #
    #   within '.records' do
    #     within '.record' do
    #       ignoring_scopes do
    #         page.should have_content 'Something outside .records .record'
    #       end
    #     end
    #   end
    def ignoring_scopes
      previous_scopes = scopes.slice!(1..-1)

      yield
    ensure
      scopes.push(*previous_scopes)
    end
  end

  module DSL
    def ignoring_scopes(&block)
      page.ignoring_scopes(&block)
    end
  end
end

Capybara.configure do |config|
  config.default_driver = :poltergeist
  config.ignore_hidden_elements = true
end

Capybara.register_driver :poltergeist do |app|
  options = {
    #The dimensions of the browser window in which to test, expressed as a 2-element array,
    :window_size => [1280, 800]
  }

  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_wait_time = 5
