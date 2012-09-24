class SleepsController < ApplicationController
  def index
    @sleeps = SleepDecorator.decorate(Sleep.chronological)
  end

  def new
    @sleep = Sleep.new
  end

  def edit
    @sleep = Sleep.find(params[:id])
  end
  
  def create
    @sleep = Sleep.new(params[:sleep])
    
    if @sleep.save
      flash[:success] = 'Successfully created sleep'
      redirect_to Sleep
    else
      render :new
    end
  end
end
