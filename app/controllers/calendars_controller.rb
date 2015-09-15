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
    # Handle shortcut deactivations
    unless params[:status].nil?
      if params[:status].match(/_m/) # == 'deactivate_prj' || params[:status] == 'deactivate_asgn'
        num = params[:status]
        @calendar.update_attribute(:month, '2')
        @calendar.save!
      # elsif params[:status].match(/activate/) # == 'activate_prj' || params[:status] == 'activate_asgn'
      #   @assignment.update_attribute(:active, true)
      #   flash[:notice] = "#{@assignment.user.proper_name} was made active."
      end
      # redirect_to project_path(@assignment.project) if params[:status].match(/_prj/)
      redirect_to calendars_path #if params[:status].match(/_asgn/)
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
