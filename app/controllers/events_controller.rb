class EventsController < ApplicationController

  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all.order("created_at DESC")
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event}
      else
        format.html { render :new, status: :unprocessable_entity, notice: "Unsuccessful"  }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end 

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :body, :date, :creator_id)
  end

end
