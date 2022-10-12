class Project < ApplicationRecord
  acts_as_tenant :organization
  has_many :artifacts, dependent: :destroy
  has_and_belongs_to_many :users
end
