module ReminderHelper

  def pretty_format(reminder, strf_code = '%Y/%m/%d')
    reminder.reminder_date.strftime(strf_code)
  end

  def date_type(reminder)
    if reminder.preset?
      'preset-date'
    else
      'custom-date'
    end
  end
end
