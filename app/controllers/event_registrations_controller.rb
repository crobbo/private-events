class EventRegistrationsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def new
    @event_registration = EventRegistration.new
  end

  def create 
    event = Event.find(params[:event_id])
    registered = event.event_registrations.build(attendee_id: current_user.id)


    if registered.save
      flash[:notice] = "You're attending!"
      redirect_to event_path(event)
    else
      flash[:notice] = "Oops something went wrong."
      redirect_to event_path(event)
    end
  end


  # private

  # def user_params
  #   params.require(:user).permit(:user_id, :email)
  # end

end
