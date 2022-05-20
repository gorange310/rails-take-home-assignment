class PortfolioStock < ApplicationRecord
  belongs_to :portfolio
  belongs_to :stock

  validates :stock, uniqueness: { scope: :portfolio_id, message: 'stock already followed' }
end
