class AddColumnLeadTimeToUserReminders < ActiveRecord::Migration
  def change
    add_column :user_reminders, :lead_time, :date
  end
end
