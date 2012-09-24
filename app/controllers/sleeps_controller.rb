class SleepsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @sleeps = SleepDecorator.decorate(current_user.sleeps.chronological)
  end

  def new
    @sleep = current_user.sleeps.new
  end

  def edit
    @sleep = current_user.sleeps.find(params[:id])
  end
  
  def create
    @sleep = current_user.sleeps.new(params[:sleep])
    
    if @sleep.save
      flash[:success] = 'Successfully logged sleep'
      redirect_to Sleep
    else
      render :new
    end
  end
end
