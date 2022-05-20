class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: %w[edit update destroy]

  def index
    params[:user_id] ||= User.first.id
    @portfolios = Portfolio.where(user_id: params[:user_id]).includes(:portfolio_stocks => :stock)
  end

  def new
    @portfolio = Portfolio.new(user_id: params[:user_id])
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save
      redirect_to portfolios_url(user_id: @portfolio.user_id)
    else
      redirect_to portfolios_url(user_id: @portfolio.user_id)
    end
  end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to portfolios_url(user_id: @portfolio.user_id)
    else
      redirect_to portfolios_url(user_id: @portfolio.user_id)
    end
  end

  def destroy
    @portfolio.destroy
    redirect_to portfolios_url(user_id: @portfolio.user_id)
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:user_id, :name)
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end
end
