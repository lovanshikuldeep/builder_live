class SellersController < ApplicationController
  def index
  end

  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      render json:  @seller
    else
      render json: { errors: 'seller could not be created'}
    end
  end

  def appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  private

  def seller_params
    params.require(:seller).permit(:name, :product_name)
  end
end
