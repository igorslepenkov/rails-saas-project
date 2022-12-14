class Organization < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :subdomain, presence: true, uniqueness: true
  validates :plan, presence: true
  has_many :users
  has_many :projects
end
