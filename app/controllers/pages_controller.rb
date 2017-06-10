class PagesController < ApplicationController
  
  def home
    @rooms = Room.limit(3)
  end

  def search
    # Check, if user has entered a location and remember it via session variable
    if params[:search].present? && params[:search].strip != ''
      session[:search_query] = params[:search]
    end

    result = Array.new

    # Find all rooms, which are nearby to the desired location
    if session[:search_query] && session[:search_query] != ''
      @rooms_address = Room.where(active: true).near(session[:search_query], 5, order: 'distance')
    else
      # .all doesn't scale well. In production, use will_paginate gem for that
      @rooms_address = Room.where(active: true).all
    end

    # Apply user filters via Ransack
    @search = @rooms_address.ransack(params[:q])
    @rooms = @search.result

    @rooms_array = @rooms.to_a

    # If user specified time frame is there, find all rooms within this constraint
    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? & !params[:end_date].empty?)
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      # If room occupied during user specified time frame, remove it from results
      @rooms.each do |room|
        not_available = room.reservations.where(
          # Case 1: start date occupied, but end date is OK
          # Case 2: start date OK, but end date is occupied
          # Case 3: both start and end date are occupied
          "(? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)
          OR (start_date < ? AND ? < end_date)",
          start_date, end_date,
          start_date, end_date,
          start_date, end_date
        ).limit(1)

        if not_available.length > 0
          @rooms_array.delete(room)
        end
      end
    end
  end
end
