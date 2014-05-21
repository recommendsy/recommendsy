class RemoveReminderStatusFromReminders < ActiveRecord::Migration
  def change
    remove_column :reminders, :sent_status
  end
end
