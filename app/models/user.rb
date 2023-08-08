class User < ApplicationRecord
  has_many :products
  has_many :appointments

  attr_accessor :google_calendar_access_token
end
