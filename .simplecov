require 'simplecov'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter 'app/channels/application_cable'
  add_filter 'app/controllers/application_controller.rb'
  add_filter 'app/controllers/welcome_controller.rb'
  add_filter 'app/helpers/application_helper.rb'
  add_filter 'app/jobs'
  add_filter 'app/mailers/application_mailer.rb'
end

