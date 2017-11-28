class Caseworker < ApplicationRecord
  belongs_to :user
  has_many :clients

	def can_add_clients?
	  if Client.where(caseworker_id: self.id).select {|c| not c.is_completed? }.count >= limit then false
	  else true
	  end
	end
end
