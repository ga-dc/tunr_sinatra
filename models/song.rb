class Song < ActiveRecord::Base
  belongs_to :artist #always singular
end
