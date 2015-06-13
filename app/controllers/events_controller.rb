class EventsController < ApplicationController
  before_action :set_event,    only: [:show, :edit, :update, :destroy, :upload]
  before_action :set_comments, only: :show

  def index
    @events = Event.all.order(updated_at: :desc)
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
      render :edit
    end
  end

  def destroy
    @event.destroy

    redirect_to events_path
  end

  def upload
    if event_uploader.upload @event
      redirect_to @event, notice: "Event successfully uploaded to Twitter"
    else
      redirect_to @event, error: "Failed to upload event to Twitter"
    end
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

  def event_uploader
    @event_uploader ||= Twitter::EventUploader.new current_user.twitter
  end
end
