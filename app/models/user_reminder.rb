class UserReminder < ActiveRecord::Base
  belongs_to :users
  belongs_to :reminders
end