class Reminder < ActiveRecord::Base
  has_many :user_reminders
  has_many :users, through: :user_reminders
end