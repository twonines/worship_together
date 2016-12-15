class Service < ActiveRecord::Base
  Day_of_week = { 'Sunday' => 1, 'Monday' => 2,'Tuesday' => 3,'Wednesday' => 4,
                  'Thursday' => 5,'Friday' => 6,'Saturday' => 7 }
  
  belongs_to :church, inverse_of: :services
  has_many :rides
  
  validates :church, presence: true
end
