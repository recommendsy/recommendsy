class UserReminder < ActiveRecord::Base
  belongs_to :user
  belongs_to :reminder
end