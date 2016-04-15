class Song < ActiveRecord::Base
  # Song <inherits from ActiveRecord::Base
  # it's like writing att_accessor or
  # def initialize name
  #   @name name
  # end
  belongs_to :artist
end
