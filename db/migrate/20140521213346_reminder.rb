class Reminder < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.date     :reminder_date
      t.boolean  :sent_status
    end
  end
end
