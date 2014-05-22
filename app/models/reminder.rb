class Reminder < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient, class_name: 'User', foreign_key: :recipient_id

  PRESET_HOLIDAYS = ["Valentine's Day", "Christmas"]

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

  def ordinalize
    reminder_date.day.ordinalize
  end

  def custom?
   !preset?
  end
  
  def preset?
    PRESET_HOLIDAYS.include?(self.title)
  end
end