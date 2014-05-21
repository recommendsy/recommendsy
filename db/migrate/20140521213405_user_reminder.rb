class UserReminder < ActiveRecord::Migration
  def change
    create_table :user_reminders do |t|
      t.integer  :user_id
      t.integer  :reminder_id
    end
  end
end
