class DropUserReminders < ActiveRecord::Migration
  def change
    drop_table :user_reminders
  end
end
