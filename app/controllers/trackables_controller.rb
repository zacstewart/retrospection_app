class TrackablesController < ApplicationController
  def create
    @trackable = current_user.trackables.new(params[:trackable])

    if @trackable.save
      flash[:success] = 'Successfully creatd new trackable'
      redirect_to @trackable
    else
      flash[:error] = 'Failed to create new trackable'
      redirect_to :back
    end
  end

  def show
    @trackable = current_user.trackables.find(params[:id])
    @trackable = TrackableDecorator.decorate(@trackable)
  end
end
