class Appointment < ActiveRecord::Base
  belongs_to :users
end