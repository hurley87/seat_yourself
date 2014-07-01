class ReservationsController < ApplicationController
	before_filter :load_restaurant


  def create
  	@reservation = @restaurant.reservations.build(reserve_params)
 		if Reservation.all.find_by(date: reserve_params[:date], slot: reserve_params[:slot], restaurant_id: params[:restaurant_id])
 			redirect_to restaurant_path(@restaurant)
 		else
 			@reservation.save
 			redirect_to root_path
 		end
	end


   private

		def reserve_params
			params.require(:reservation).permit(:slot, :date, :user_id, :restaurant_id)
		end

		def load_restaurant
			@restaurant = Restaurant.find(params[:restaurant_id])
		end
end
