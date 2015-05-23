class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :user,          presence: true
  validates :created_at,    presence: true
  validates :text, :id_str, presence: true, length: { minimum: 2 }

  validates_associated :user
end
