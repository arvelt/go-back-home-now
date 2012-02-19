class Endtime < ActiveRecord::Base

  #Like検索用のぷらぐいん
  simple_column_search :date

  #ユニークかどうか
  validates :date ,
    :uniqueness => { :scope => :user_id }
end
