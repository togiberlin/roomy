class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_room, only: [:show, :edit, :update]

  def index
    @rooms = current_user.rooms
  end

  def show
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      redirect_to @room, notice: 'Saved!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: 'Updated!'
    else
      render :edit
    end
  end

  private

    def find_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate, 
                                   :bed_room, :bath_room, :listing_name, 
                                   :summary, :address, :is_tv, :is_kitchen,
                                   :is_air, :is_heating, :is_internet,
                                   :price, :active)
    end
end
