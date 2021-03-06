class TravelTimesController < ApplicationController
  before_action :require_login

  def index
    @travel_times = current_user.travel_times.order('created_at DESC')
  end

  def new
    render layout: false
  end

  def create
    # create connection and call distance api
    uri = URI('https://maps.googleapis.com/maps/api/distancematrix/json?')
    parameters = { units: 'imperial',
                   origins: params[:start_point],
                   destinations: params[:end_point],
                   key: Rails.application.credentials.google[:key] }

    # if selected something else than driving add more params to the api call
    if params[:transit_mode] != 'driving'
      parameters[:mode] = 'transit'
      parameters[:transit_mode] = params[:transit_mode]
    end

    uri.query = URI.encode_www_form(parameters)
    response = Net::HTTP.get_response(uri)
    response_hash = JSON.parse(response.body, :symbolize_names => true)

    if response_hash[:status] == 'INVALID_REQUEST' ||
       nested_hash_value(nested_hash_value(response_hash, :elements), :status) == 'ZERO_RESULTS'
      render json: { error: 'I cannot find any routes with the given data' }
    else
      # create TraveTime object and store it to the db
      travel_time =
        TravelTime.new(start_point: response_hash[:origin_addresses].join,
                       end_point: response_hash[:destination_addresses].join,
                       distance: nested_hash_value(nested_hash_value(response_hash, :distance), :text),
                       duration: nested_hash_value(nested_hash_value(response_hash, :duration), :text),
                       user_id: current_user.id,
                       transit_mode: params[:transit_mode])
      travel_time.save
      render partial: 'travel_time_row',
             locals: { travel_time: travel_time },
             layout: false
    end
  end

  def destroy
    TravelTime.find(params[:id]).delete
    render html: 'deleted'
  end

  private

  # find nested key and value in hash
  def nested_hash_value(obj, key)
    if obj.respond_to?(:key?) && obj.key?(key)
      obj[key]
    elsif obj.respond_to?(:each)
      r = nil
      obj.find { |*a| r = nested_hash_value(a.last, key) }
      r
    end
  end

  def require_login
    return if user_signed_in?

    flash[:error] = 'You must be logged in to access this section'
    redirect_to new_user_session_url
  end
end
