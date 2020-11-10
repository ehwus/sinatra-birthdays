require 'birthday'
require 'date'

describe Birthday do
  it "allows creation with a date" do
    test_date = Date.new(1995,1,1)
    Birthday.new(test_date)
  end

  describe "#days_until_birthday" do
    it "returns zero if given todays date as input" do
      test = Birthday.new(Date.today)
      expect(test.days_until_birthday).to eq(0)
    end

    it "returns 30 if birthday in 30 days" do
      thirty_days_from_now = Date.today.next_day(30)
      test = Birthday.new(thirty_days_from_now)
      expect(test.days_until_birthday).to eq(30)
    end

    it "returns 335 if birthday was 30 days ago" do
      thirty_days_ago = Date.today.prev_day(30)
      test = Birthday.new(thirty_days_ago)
      expect(test.days_until_birthday).to eq(335)
    end
  end
end