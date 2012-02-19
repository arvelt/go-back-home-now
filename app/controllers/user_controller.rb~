#<Encoding:UTF-8>
require 'twitter'

class UserController < ApplicationController 

  CONSUMER_KEY = 'aLLC79cZvRHKe8jawQaGA'
  CONSUMER_SERCRET = 'CMQp4Azbz1ad8bMcVqwQF0kmEE4MixkQpciqPmDc'

  #１行分のデータを保持するクラス
  class Timeslist
	@date
	@starttime
	@endtime
	attr_accessor :date, :starttime , :endtime
  end

  def index

    #ログインしてないときは戻す
    if session[:user_id] == nil then
      redirect_to :controller => 'index' , :action => 'index'
      return
    end

	@notice = params[:notice]

	#パラメータなどを取得
	user_id = session[:user_id]
	p user_id
	if params[:selected_date] == nil then
		selected_date = Time.now.strftime("%Y%m")
	else
		selected_date = params[:selected_date].sub("/","")
	end

	#DB検索  日付のLikeにプラギン使用
    @user = User.where(:user_id =>user_id).first
	@starttimes = Starttime.where(:user_id =>user_id ).search(selected_date)
	@endtimes = Endtime.where(:user_id =>user_id , ).search(selected_date)
	now = Time.now

	#表示月フォームに設定する日付を検索
	@used_month = []
	months = Starttime.select('distinct created_at').where(:user_id =>user_id)
    p "eval month"
    p months
    if months == nil then
        #登録がないときは当月
        @used_month << Time.now.strftime("%Y/%m")
    else
        #登録があればその月を表示、複数あれば降順にソート
	    months.each do | list |
		    @used_month << list.created_at.strftime("%Y/%m")
	    end
        @used_month.uniq!.sort!.reverse! unless @used_month.length == 1         	
    end

	#月初日と月末日を取得
	d_selected_date = Date.strptime( selected_date ,"%Y%m")
	firstday = Date.new(d_selected_date.year,d_selected_date.month,1)
	lastday  = Date.new(d_selected_date.year,d_selected_date.month,-1)

	#p @starttimes.index{ |data| data.date == '20111222'}

	#ひと月分の表示用リストを作る
	list = Array.new
	for date  in firstday.day..lastday.day do
		_tmp = Timeslist.new		
		_tmp.date  = Date.new(d_selected_date.year,d_selected_date.month,date)
		
		#日付が等しいstartがあれば設定
		sindex = @starttimes.index{ |data| data.date == _tmp.date.strftime("%Y%m%d")}
		_tmp.starttime = @starttimes[sindex].time.strftime("%H:%M") unless sindex == nil

		#日付が等しいendがあれば設定
		eindex = @endtimes.index{ |data| data.date == _tmp.date.strftime("%Y%m%d")}
		_tmp.endtime = @endtimes[eindex].time.strftime("%H:%M") unless eindex == nil

		#日付を整形
		_tmp.date = _tmp.date.strftime("%Y/%m/%d")

		#リストに追加
		list << _tmp
	end
	p list
	@timeslist = list
	respond_to do |format|
		format.html
		format.json { render :js =>@timeslist.to_json}
	end
  end

  def add_start
	#現在のユーザーにstart時間を追加する

	  user_id = session[:user_id]
	  tmp = Starttime.new
	  tmp.user_id = user_id
	  tmp.date = Time.new.strftime("%Y%m%d").to_s
	  tmp.time = Time.new.strftime("%H:%M").to_s

	  if tmp.save then

      #ツイッターに投稿する設定なら投稿する
      if session[:account_type] == 'twitter' then

        user = User.where(:user_id=>user_id).first
        if user.twitter_poststart == true then

          Twitter.configure do |config|
            config.consumer_key = CONSUMER_KEY
            config.consumer_secret = CONSUMER_SERCRET
            config.oauth_token = session[:token_key]
            config.oauth_token_secret = session[:secret_key]
          end

          dd = Time.new.strftime("%m/%d").to_s
          tt = tmp.time.strftime("%H:%M").to_s
          msg = "さあはじめるよ！　"+ dd + "　" + tt +"　[by もうおうちかえる！]"
          Twitter.update( msg )
        end
      end

	    redirect_to :action => 'index'
    else
	    redirect_to :action => 'index' , :notice => 'すでに本日は使用されています'
    end
  end

  def add_end
	#現在のユーザーにend時間を追加する
	user_id = session[:user_id]
	tmp = Endtime.new
	tmp.user_id = user_id
	tmp.date = Time.new.strftime("%Y%m%d").to_s
	tmp.time = Time.new.strftime("%H:%M").to_s

	if tmp.save then

      #ツイッターに投稿する設定なら投稿する
      if session[:account_type] == 'twitter' then
        user = User.where(:user_id=>user_id).first
        if user.twitter_postend == true then
          Twitter.configure do |config|
            config.consumer_key = CONSUMER_KEY
            config.consumer_secret = CONSUMER_SERCRET
            config.oauth_token = session[:token_key]
            config.oauth_token_secret = session[:secret_key]
          end

          dd = Time.new.strftime("%m/%d").to_s
          tt = tmp.time.strftime("%H:%M").to_s
          msg = "もうおうちかえる！　"+ dd + "　" + tt + "　[by もうおうちかえる！]"
          Twitter.update( msg )
        end
      end

	  redirect_to :action => 'index'
    else
	  redirect_to :action => 'index' , :notice => 'すでに本日は使用されています'
    end
  end

  def logout
    reset_session
    redirect_to :controller => 'index' , :action => 'index'
    return
  end

end

