class AddRecepientIdToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :recipient_id, :integer
  end
end
