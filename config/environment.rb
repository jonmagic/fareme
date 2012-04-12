# Load the rails application
require File.expand_path('../application', __FILE__)
require File.expand_path('../../lib/fareme', __FILE__)

# Initialize the rails application
Fareme::Application.initialize!
