class TrackingsController < ApplicationController
  def create
    trackable = current_user.trackables.find(params[:trackable_id])
    tracking = trackable.trackings.new(params[:tracking])

    if tracking.save
      flash[:success] = "Tracked #{trackable.name}"
    else
      flash[:error] = "Failed to track #{trackable.name}"
    end

    redirect_to trackable
  end
end
