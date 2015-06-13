class EventsController < ApplicationController
  before_action :set_event,    only: [:show, :edit, :update, :destroy]
  before_action :set_comments, only: :show

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: "Comment successfully created"
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render action: "edit"
    end
  end

  def destroy
    @event.destroy

    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_comments
    @commentable = @event
    @comments    = @commentable.comments
    @comment     = Comment.new
  end

  def event_params
    params.require(:event).permit(:title, :description)
  end
end
