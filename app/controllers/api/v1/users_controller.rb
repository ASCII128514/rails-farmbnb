# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  protect_from_forgery with: :null_session

  def login
    code = params[:code]
    puts code.nil?
    if code.nil?
      # retreive the user info if they already have one format: { token: 'token' }
      a = token_params
      authen = a['token']

      # retrieve the openid from the authen
      openid = decode(authen)
      render json: {
        status: 200
      }
    else
      # send info to the wehat api to get open id and store them into the storage
      token = RestClient.get("https://api.weixin.qq.com/sns/jscode2session?appid=#{ENV['APPID']}&secret=#{ENV['SECRET_KEY']}&js_code=#{params[:code]}&grant_type=authorization_code")
      # parse into json format and store the openid in the hash
      openid = JSON.parse(token)['openid']
      payload = { token: openid }

      # store all the info from the user
      @user = User.new
      @user.openId = openid
      @user.save

      authen = JWT.encode payload, nil, 'none'
      render json: {
        authen: authen
      }
    end
  end

  def farmer_list
    a = params[:tokens]
    token = JSON.parse(a)['token']
    # p decode(token)
    puts "\n\n\n\n\n run in farmer list"
    @user = User.where(openId: decode(token)['token'])[0]
    print @user
    render json: {
      user: @user.products
    }
  end

  private

  def decode(token)
    # decode the jwt token to the open id
    t = JWT.decode token, nil, false
    t[0]
  end

  def token_params
    params.require(:tokens).permit(:token)
  end
end
