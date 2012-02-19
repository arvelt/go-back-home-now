class Starttime < ActiveRecord::Base

  #Like検索用のプラグイン
  simple_column_search :date

  #ユニークとする
  validates :date ,
    :uniqueness => { :scope => :user_id }
end
