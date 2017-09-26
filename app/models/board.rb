class Board < ActiveRecord::Base
  belongs_to :user

  def fmt_date
    created_at.in_time_zone("America/Chicago").strftime("%I:%M %p on %d %b %Y") if created_at
  end
end
