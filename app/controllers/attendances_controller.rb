class AttendancesController < ApplicationController
    def create
      @event = Event.find(params[:event_id])
      current_user.attendances.create(attended_event: @event)
      redirect_to @event, notice: "You are now attending the event."
    end
  
    def destroy
      @attendance = Attendance.find(params[:id])
      @event = @attendance.attended_event
      @attendance.destroy
      redirect_to @event, notice: "You are no longer attending the event."
    end
end