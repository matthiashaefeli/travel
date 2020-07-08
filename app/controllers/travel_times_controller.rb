class TravelTimesController < ApplicationController
  before_action :require_login

  def index
    @travel_times = TravelTime.order('created_at DESC')
  end

  private

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_url
    end
  end
end
