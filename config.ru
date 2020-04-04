require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# In order to send patch and delete requests, I will need to add a line of code here

use Rack::MethodOverride

# Mount Controller here

use UsersController
use GratitudeEntriesController

run ApplicationController
