class Admin::DashboardController < ApplicationController
 
  http_basic_authenticate_with name: ENV["USRE_NAME"], password: ENV["PASSWORD"]
  
  def show
  end
end
