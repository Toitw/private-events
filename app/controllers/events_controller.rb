class EventsController < ApplicationController
    def index
        @events = Event.all
        @event = Event.new
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = current_user.created_events.new
    end

    def create
        @event = current_user.created_events.build(event_params)
    
        if @event.save
          redirect_to @event, notice: 'Event was successfully created.'
        else
          render :new
        end
    end    

    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to events_path
    end

    def edit
        @event = Event.find(params[:id])
        #I want to be able to edit name and date
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
          redirect_to @event, notice: 'Event was successfully updated.'
        else
          render :edit
        end
    end

    private

  def event_params
    params.require(:event).permit(:title, :date, :location)
  end
end
