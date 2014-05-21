class Reminder < ActiveRecord::Base
  has_many :user_reminders
  has_many :users, through: :user_reminders


  def self.set_holidays
    this_year = Date.today.year
    
    find_or_create_by(
      title: "Valentine's Day", 
      reminder_date: Date.civil(this_year, 2, 14)
    )
    
    find_or_create_by(
      title: "Christmas", 
      reminder_date: Date.civil(this_year, 12, 25)
    )
  end
end