class ProductsController < ApplicationController
  before_action :find_user

  def index
    @product = Product.all
  end

  def create
    @product =@user.products.create(product_params)
    if @product.save
        render json: @product
    else
      render json: { errors: 'product could not be created'}
    end
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :description, :user_id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
