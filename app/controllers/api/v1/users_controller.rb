# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::ApplicationController
  def login
    if params[:code].nil?
      # retreive the user info if they already have one format: { token: 'token' }
      authen = params[:authen]

      # retrieve the openid from the authen
      openid = decode(authen)
      render json: {
        status: 200
      }
    else
      # send info to the wehat api to get open id and store them into the storage
      token = RestClient.get("https://api.weixin.qq.com/sns/jscode2session?appid=#{APPID}&secret=#{SECRET_KEY}&js_code=sdasds&grant_type=authorization_code")
      # parse into json format and store the openid in the hash
      openid = JSON.parse(token)['openid']
      payload = { token: openid }
      authen = JWT.encode payload, nil, 'none'
      render json: {
        authen: authen
      }
    end
  end

  def farmer_list
    token = params[:id]
    @user = User.where(openId: decode(token))[0]
    render json: {
      user: @user.products
    }
  end

  def decode(token)
    # decode the jwt token to the open id
    t = JWT.decode token, nil, false
    t[0]['token']
  end
end
