class Caseworker < ActiveRecord::Base
  belongs_to :user
  has_many :clients

  before_save :update_user_email

  def update_user_email
    if self.user
      self.user.email = self.email
      if self.user.save
        return true
      else
        self.errors.add(:email, "There is another user with that email.")
        return false
      end
    end
  end

  def can_add_clients?
    #if clients.select {|c| not c.is_completed? }.count >= limit then false
    if Client.find(:all, :conditions => ["caseworker_id = ?", self.id]).select {|c| not c.is_completed? }.count >= limit then false
    else true
    end
  end
end
