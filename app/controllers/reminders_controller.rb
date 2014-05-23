class RemindersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reminders = @user.reminders
  end

  def update
    @reminder = Reminder.find(params[:reminder_id])
    @reminder.active = params[:active] == 'true' ? true : false
    @reminder.save

    respond_to do |format|
      format.js {}
    end
  end

end
