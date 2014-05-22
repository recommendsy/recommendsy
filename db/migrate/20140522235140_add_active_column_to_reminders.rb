class AddActiveColumnToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :active, :boolean
  end
end
