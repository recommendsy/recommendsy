class RemindersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reminders = @user.reminders
  end

end
