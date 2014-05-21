class AddTitleColumnToReminderTable < ActiveRecord::Migration
  def change
    add_column :reminders, :title, :string
  end
end
