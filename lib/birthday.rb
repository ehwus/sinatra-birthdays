require 'date'

class Birthday
  def initialize(dob)
    @dob = dob
  end

  def days_until_birthday
    (@dob.yday - Date.today.yday) % 365
  end
end