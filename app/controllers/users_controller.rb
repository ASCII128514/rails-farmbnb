# frozen_string_literal: true

class UsersController < ApplicationController
  def login
    if params[:code].nil?
      # retreive the user info if they already have one format: { token: 'token' }
      authen = params[:authen]

      # retrieve the openid from the authen
      h = JWT.decode authen, nil, false
      openid = h[0]['token']
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
end
