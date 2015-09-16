
class TasksController < ApplicationController
  # before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :all_tasks, only: [:index, :edit, :create, :update, :destroy]
  before_action :set_tasks, only: [:edit, :update, :destroy]
  respond_to :html, :js
  # GET /tasks
  # GET /tasks.json
  # def index
  #   @tasks = Task.all
  # end

  # GET /tasks/1
  # GET /tasks/1.json
  # def show
  # end

  # GET /tasks/new
  def new
    @task = Task.new
    @task.event_id = params[:id] unless params[:id].nil?
  end

  # GET /tasks/1/edit
  def edit
    unless params[:status].nil?
      if params[:status] == 'completed'
        @task.update_attribute(:is_complete, true)
        @task.save!
      elsif params[:status] == 'incomplete'
        @task.update_attribute(:is_complete, false)
        @task.save!
      end
      redirect_to calendars_path 
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.save!
    # respond_to do |format|
    #   if @task.save
    #     format.html { redirect_to @task, notice: 'Task was successfully created.' }
    #     format.json { render :show, status: :created, location: @task }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    if @task.update_attributes(task_params)
      redirect_to @calendar
    else
      render :action => 'edit'
    end
  end
  # def update
  #   @task.update_attributes(task_params)
  # end
  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    # respond_to do |format|
    #   format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    def all_tasks
      @tasks = Task.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_tasks
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:event_id, :name, :description, :end_date, :end_time, :is_complete)
    end
end
