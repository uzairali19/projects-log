class ApplicationController < ActionController::Base
  protect_from_forgery
  attr_accessor :page_title
end
