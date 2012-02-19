class SettingController < ApplicationController
  def index
    @notice = params[:notice]

    #userテーブルに設定されている項目をひいて表示する
    user_id = session[:user_id]
    @user = User.where(:user_id=>user_id).first
    p "set index"
    p @user

    #アカウント情報でビューを分ける
    unless @user.account_type == nil then
      if @user.account_type == "twitter" then
        render 'setting/index_twitter'
      else
        render 'setting/index_google'
      end
    end

    #ログインしていないときは戻す
    if session[:user_id] == nil then
      redirect_to :controller => 'index' , :action => 'index'
      return
    end
  end

  def set_status

    #ユーザー情報取得
    user_id = session[:user_id]
    user = User.where(:user_id=>user_id).first

    #p "show user"
    #p user

    #はじまり時間
    unless params[:start_check] == nil then
      user.twitter_poststart = true
    else
      user.twitter_poststart = false
    end

    #おわり時間
    unless params[:end_check] == nil then
      user.twitter_postend = true
    else
      user.twitter_postend = false
    end

    #保存する
    if user.save then
      redirect_to :controller => 'setting' , :action => 'index'
    else
      flash[:notice] = "Setting Update is failed"
      redirect_to :controller => 'setting' , :action => 'index'
    end
  end
end
