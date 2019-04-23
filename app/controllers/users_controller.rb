# frozen_string_literal: true

class UsersController < ApplicationController
  def login
    if params[:code].nil?
      # retreive the user info if they already have one
      token = params[:token]
    else
      # send info to the wehat api to get open id and store them into the storage
      RestClient.get("https://api.weixin.qq.com/sns/jscode2session?appid=#{APPID}&secret=#{SECRET_KEY}&js_code=sdasds&grant_type=authorization_code")
    end
  end
end
