class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @badges = @user.badges if current_user == @user
  end
end
