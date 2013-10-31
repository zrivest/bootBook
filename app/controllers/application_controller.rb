require 'application_helper'
require 'users_helper'
class ApplicationController < ActionController::Base
  include ApplicationHelper
  include UsersHelper
  protect_from_forgery
end
