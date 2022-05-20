class Portfolio < ApplicationRecord
  has_many :portfolio_stocks
  has_many :stocks, :through => :portfolio_stocks
end
