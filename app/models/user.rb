class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_one :caseworker

  before_create :create_related_models

  ROLES = %w[admin caseworker]

  scope :with_role, lambda { |role|
    where("roles_mask & #{2**ROLES.index(role.to_s)} > 0 ")
  }

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def role_symbols
    roles.map(&:to_sym)
  end

  def create_related_models
    cw = Caseworker.create(:email => email)
    self.caseworker = cw
  end

  def is_admin?; role_symbols.include?(:admin); end
  def is_caseworker?; role_symbols.include?(:caseworker); end

  def has_ownership?(model)
    if model.respond_to?(:user)
      return true if model.user.id == self.id
    elsif model.respond_to?(:caseworker)
      return true if model.caseworker.user.id == self.id
    end
    return false
  end
end
