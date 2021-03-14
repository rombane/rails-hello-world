class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  has_many :purchases

  has_many :batches, through: :purchases

  validates :phone_number, format: { with: /(^\+62|62|^08)(\d{3,4}-?){2}\d{3,4}/i, message: "Enter Indonesian phone number"}

  def login=(login)
    @login = login
  end

  def login
    @login || self.phone_number || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(phone_number) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:phone_number) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
