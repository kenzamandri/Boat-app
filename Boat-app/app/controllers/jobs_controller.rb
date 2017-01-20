class JobsController < ApplicationController

  def index
    @jobs =Job.all
  end

  def new
    @message = "This is new page"
    @job = Job.new
    #this is proving an array of all the boats within this job
    @boats_arr = Boat.all

    # errors:
    puts "ERRORS:"
    puts @job.errors.full_messages.inspect

  end

  def create
    puts "check here", params.inspect
    @new_job = Job.create(
      name: params[:job][:name],
      description: params[:job][:description],
      origin: params[:job][:origin],
      destination: params[:job][:destination],
      cost: params[:job][:cost],
      amt_container: params[:job][:amt_container]
    )
    
    params[:boat][:boat_ids].each do |boat_id|
      @id = boat_id.to_i
      @new_job.boats << Boat.find(@id)
    end

    if (@new_job)
      redirect_to url_for(:controller => :jobs, :action => :index)
    else
      redirect_to url_for(:controller => :jobs, :action => :new)
    end
  end


  def show
      @job =Job.find(params[:id])
      # this is how you obtain all the boats of one specific job
      @job_boats = @job.boats
      @boats = Boat.all
      puts "HOW SHOW SHOW", @job_boats
      # @boats_job = Job.where(params[:boat][:boat_ids])

  end

  def edit
      @message = "this is edit"
      @job = Job.find(params[:id])
      @boats_arr = Boat.all
  end

  def update
      @job = Job.find(params[:id])
      @job.update({
        name: params[:job][:name],
        description: params[:job][:description],
        origin: params[:job][:origin],
        destination: params[:job][:destination],
        cost: params[:job][:cost],
        amt_container: params[:job][:amt_container]
      })
      @job.boats.clear
      # Add genres to book:
      # Genre comes in as an array of strings
      params[:job][:boat_ids].each do |boat_id|
        @job.boats << Boat.find(boat_id.to_i)
      end

      if (@job)
        redirect_to url_for(:controller => :jobs, :action => :show, :id => params[:id])
      else
        redirect_to url_for(:controller => :jobs, :action => :edit)
      end
  end

  def destroy
    Job.delete(params[:id])
    redirect_to url_for(:controller => :jobs, :action => :index)
  end

  def add_boat
    @job = Job.find(params[:id])
    @boat = Boat.find(params[:id])

    @job.boats.push(@boat)
  end
  def remove_boat
    @job = Job.find(params[:id])
    @boat = Boat.find(params[:id])

    @job.boats.delete(@boat)
  end


end
