class Client < ApplicationRecord
  belongs_to :caseworker


  def self.count_new(last_seen)
    all.select { |c| c.recent?(last_seen) }.count
  end

  def is_completed?
    completed_at
  end

  def is_completed
    if is_completed? then true
    else return false
    end
  end

  def is_completed=(bool)
    if bool == false || bool == nil || bool == "false"
      self.completed_at = nil
    else  self.completed_at = DateTime.now
    end
  end

  def complete!
    self.completed_at = DateTime.now
    self.save
  end

  def recent?(last_seen)
    created_at > last_seen
  end

  def fmt_date
    date.in_time_zone("America/Chicago").strftime("%d %b %Y") if date
  end
end
