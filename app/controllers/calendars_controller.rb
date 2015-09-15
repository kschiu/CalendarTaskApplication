class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @calendars = Calendar.all
    @calendar = Calendar.first
    respond_with(@calendars)
  end

  def show
    respond_with(@calendar)
  end

  def new
    @calendar = Calendar.new
    respond_with(@calendar)
  end

  def edit
    unless params[:status].nil?
      if params[:status].length == 4
          str = params[:status].byteslice(0,2)
        else
          str = params[:status].byteslice(0,1)
        end
      if params[:status].match(/_m/) 
        @calendar.update_attribute(:month, str)
        @calendar.save!
      else
        @calendar.update_attribute(:day, str)
        @calendar.save!
      end
      redirect_to calendars_path 
    end
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.save
    respond_with(@calendar)
  end

  def update
    if @calendar.update_attributes(calendar_params)
      redirect_to @calendar
    else
      render :action => 'edit'
    end
    # @calendar.update(calendar_params)
    # respond_with(@calendar)
  end

  def destroy
    @calendar.destroy
    respond_with(@calendar)
  end

  private
    def set_calendar
      @calendar = Calendar.find(params[:id])
    end

    def calendar_params
      params.require(:calendar).permit(:year, :month, :day)
    end
end
