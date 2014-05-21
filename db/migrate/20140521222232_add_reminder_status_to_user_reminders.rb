class AddReminderStatusToUserReminders < ActiveRecord::Migration
  def change
    add_column :user_reminders, :sent_status, :boolean
  end
end
