# frozen_string_literal: true

class Api::V1::ProductsController < Api::V1::BaseController
  protect_from_forgery with: :null_session

  def destroy
    @product = Product.find(params[:id])
    token = token_params[:token]
    if @product.user == User.where(openId: decode(token))[0]
      @product.destroy
      render json: {
        status: 200,
        product: @product
      }
    else
      render json: {
        status: 400,
        msg: 'invalid token'
      }
    end
  end

  def create
    token = token_params[:token]
    @product = Product.new(create_product)
    @list = Listing.new
    @list.product = @product
    @list.quantity = params[:quantity]
    if User.where(openId: decode(token))[0].nil?
      render json: {
        status: 403,
        msg: 'invalid user token'
      }
    else
      @product.user = User.where(openId: decode(token))[0]
      @product.save
      @list.save
      render json: {
        status: 200,
        product: @product
      }
    end
  end

  private

  def token_params
    params.require(:tokens).permit(:token)
  end

  def create_product
    # unit price inventory product name description url
    params.require(:product).permit(:unit, :product_price, :product_name, :picture_url, :description, :quantity)
  end

  def decode(token)
    puts '--------------------------'
    p token
    puts "\n\n\n\n\n\n\n\n\n"
    # decode the jwt token to the open id
    t = JWT.decode token, nil, false
    t[0]
  end
end
