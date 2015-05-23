class User < ActiveRecord::Base
  has_many :tweets

  validates :created_at,                  presence: true
  validates :name, :id_str, :screen_name, presence: true, length: { minimum: 2 }
end
