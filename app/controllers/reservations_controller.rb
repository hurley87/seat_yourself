class ReservationsController < ApplicationController
	before_filter :load_restaurant


  def create
  	@reservation = @restaurant.reservations.build(reserve_params)
  	@reservation.user_id = current_user.id


  		if @restaurant.reservations.find_by(date: @reservation.date, slot: @reservation.slot) && @reservation.save
	 				redirect_to restaurant_path(@restaurant)
	 		else
	 			if @reservation.save
	 				redirect_to user_path(current_user)
	 			else
	 				render "restaurants/show"
	 			end
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
