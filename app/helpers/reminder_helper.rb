module ReminderHelper

  def pretty_format(reminder)
    reminder.reminder_date.strftime('%Y/%m/%d')
  end
end
