class PortfolioFollowStockService
  attr_accessor :portfolio, :keyword

  def initialize(portfolio, keyword)
    @portfolio = portfolio
    @keyword = keyword.to_s.strip
  end

  def call
    if search_stock
      portfolio_stock = portfolio.portfolio_stocks.new(stock: search_stock)
      portfolio_stock.save
    else
      false
    end
  end

  private

  def search_stock
    Stock.find_by("name LIKE ? OR ticker LIKE ?", keyword, keyword)
  end
end
