class Artist < ActiveRecord::Base
  has_many :songs #always plural
end
