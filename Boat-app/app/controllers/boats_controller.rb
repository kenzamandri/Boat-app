class BoatsController < ApplicationController

  def index
   @boats = Boat.all
  end

  def new
    @boat = Boat.new
    @message = "my new boat"
  end

  def create


    @boat = Boat.create(
      name: params[:boat][:name],
      location: params[:boat][:location],
      amt_container: params[:boat][:amt_container].to_i,
      company_id: params[:boat][:company_id],
      image: params[:boat][:image]
      )



    if (@boat)
      redirect_to url_for(:controller => :boats, :action => :index)
    else
      redirect_to url_for(:controller => :boats, :action => :new)
    end
  end

  def show
      @boat = Boat.find(params[:id])
      # this is how you obtain all the boats of one specific boat
      @boat_jobs = @boat.jobs

  end

  def edit
      @message = "this is edit"
      @boat = Boat.find(params[:id])
  end

  def update
      @boat = Boat.find(params[:id])
      @boat.update({
        name: params[:boat][:name],
        location: params[:boat][:location],
        amt_container: params[:boat][:amt_container].to_i,
        company_id: params[:boat][:company_id],
          image: params[:boat][:image] 
      })

      if (@boat)
        redirect_to url_for(:controller => :boats, :action => :index)
      else
        redirect_to url_for(:controller => :boats, :action => :edit)
      end
  end

  def destroy
    Boat.delete(params[:id])
    redirect_to url_for(:controller => :boats, :action => :index)
  end


end
