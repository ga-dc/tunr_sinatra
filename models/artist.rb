class Artist < ActiveRecord::Base
  # Artist <inherits from ActiveRecord::Base
  has_many :songs
end
