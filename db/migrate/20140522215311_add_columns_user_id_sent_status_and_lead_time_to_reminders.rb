class AddColumnsUserIdSentStatusAndLeadTimeToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :user_id, :integer
    add_column :reminders, :sent_status, :boolean
    add_column :reminders, :lead_time, :integer
  end
end
