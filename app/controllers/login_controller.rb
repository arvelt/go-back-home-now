require 'json'

class LoginController < ApplicationController

  HOSTNAME = "http://go-back-home-now.heroku.com/"

  def index
  end

  def oauth_twitter_callback
    puts "oauth_twitter_callback"

	#拒否された場合は戻る
	unless params[:denied] == nil then
		redirect_to :controller => 'index' , :action => :index
		return
	end

    #omnioauthで認証しておいたところから取得して保存
	#raise request.env["omniauth.auth"].to_yaml
	data = request.env["omniauth.auth"]

    user = User.new
    user.user_id = data['uid']
    user.name = data['info']['name']
    user.account_type = "twitter"
	session[:account_type] = user.account_type

	session[:name] = data['info']['name']
	session[:user_id] = data['uid']
	session[:token_key] = data['credentials']['token']
	session[:secret_key] = data['credentials']['secret']
    
    #すでにあるときは登録せずマイページへ
    unless User.where(:user_id => user.user_id) == nil
      redirect_to :controller => 'user' , :action => :index
    else  

        #ユーザー情報を保存して個人ページへ
        if user.save
          redirect_to :controller => 'user' , :action => :index
        else
          flash[:notice] = "User save is failed"
          redirect_to :controller => 'index' , :action => 'index'
        end
    end
  end

  def oauth_google_callback
	puts "google_callbacked"

    #omnioauthで認証しておいたところから取得して保存
	#raise request.env["omniauth.auth"].to_yaml
	data = request.env["omniauth.auth"]

    user = User.new
    user.user_id = data['uid']
    user.name = data['info']['name']
    user.account_type = "google"

	session[:name] = data['info']['name']
	session[:user_id] = data['uid']
	session[:account_type] = user.account_type

    #すでにあるときは登録せずマイページへ
    unless User.where(:user_id => user.user_id) == nil
      redirect_to :controller => 'user' , :action => :index
    else

        #ユーザー情報を保存して個人ページへ
        if user.save
          redirect_to :controller => 'user' , :action => :index
        else
          flash[:notice] = "User save is failed"
          redirect_to :controller => 'index' , :action => 'index'
        end
    end
  end

  def auth_failure
    #認証失敗時  
    flash[:notice] = "Authentication failed"
    redirect_to :controller => 'index' , :action => :index
  end

end
