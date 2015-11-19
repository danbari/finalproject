class Person < ActiveRecord::Base
validates :firstname, presence: true
validates :lastname, presence: true

validates :username, presence: true, uniqueness: true
has_secure_password


	def custname
		lastname + ", " + firstname
    end

  # One person may have many sales
  # Delete dependent sales when delete person
  has_many :sale, dependent:  :destroy

end
