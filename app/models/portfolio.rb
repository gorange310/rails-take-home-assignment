class Portfolio < ApplicationRecord
  belongs_to :user

  has_many :portfolio_stocks
  has_many :stocks, :through => :portfolio_stocks

  before_create :set_position

  private

  def set_position
    self.position = self.user.portfolios.size
  end
end
