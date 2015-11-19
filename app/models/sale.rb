class Sale < ActiveRecord::Base
  # Each sale belongs to only 1 person
  belongs_to :person

  # Each sale belongs to only 1 product
  belongs_to :product

end
