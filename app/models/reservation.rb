class Reservation < ActiveRecord::Base
	validates :slot, :numericality => { :less_than_or_equal_to => 3 }, :presence => true
	belongs_to :user
	belongs_to :restaurant


end
