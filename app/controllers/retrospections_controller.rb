class RetrospectionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:q].present?
      retrospections = current_user.retrospections.search(params[:q])
    else
      retrospections = current_user.retrospections.chronological.all
    end
    @retrospections = RetrospectionDecorator.decorate(retrospections)

    respond_to do |format|
      format.html
      format.json { render json: @retrospections }
  end

  def show
    get_retrospection
    
    respond_to do |format|
      format.html do
        if @retrospection.new_record?
          render :new
        else
          render :show
        end
      end
      format.json { render json: @retrospection }
    end
  end

  def edit
    get_retrospection
  end
  
  def update
    get_retrospection
    
    if @retrospection.update_attributes(params[:retrospection])
      flash[:success] = 'Successfully updated retrospection'
      redirect_to @retrospection
    else
      render :edit
    end
  end

  def create
    @retrospection = current_user.retrospections.new(params[:retrospection])

    if @retrospection.save
      redirect_to @retrospection
    else
      render :new
    end
  end

private

  def get_retrospection
    id = params[:id] == 'today' ? Date.today.to_s : params[:id]
    @retrospection = RetrospectionDecorator.decorate(current_user.retrospections.find_by_param(id))
  end
end
