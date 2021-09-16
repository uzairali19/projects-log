class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @page_title = 'Users'
  end

  def show
    @user = User.find(params[:id])
  end
end
