class StocksController < ApplicationController
  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def create
    keyword = params[:keyword]
    @portfolio = Portfolio.find(params[:portfolio_id])
    result = PortfolioFollowStockService.new(@portfolio, keyword).call

    if result
      redirect_to portfolios_url(@portfolio)
    else
      flash[:alert] = "找不到股號或股名 #{keyword} 或重複追蹤"
      render :new
    end
  end

  def destroy
    @portfolio_stock = PortfolioStock.find(params[:id])
    @portfolio_stock.destroy
    redirect_to portfolios_url
  end
end
