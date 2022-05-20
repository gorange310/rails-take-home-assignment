require 'rails_helper'

RSpec.describe PortfolioFollowStockService do
  fixtures :all

  describe '#call' do
    subject(:service) { PortfolioFollowStockService.new(portfolio, keyword).call }
    let(:portfolio) { portfolios(:portfolio1) }
    let(:stock) { stocks(:stock1) }

    context 'when keyword match ticker' do
      let(:keyword) { 2330 }
      it 'return true' do
        expect(portfolio.portfolio_stocks.find_by(stock: stock)).to be_nil
        expect { service }.to change(PortfolioStock, :count).by(1)
        expect(service).to be_truthy
        expect(portfolio.portfolio_stocks.find_by(stock: stock)).to be_present
      end
    end

    context 'when keyword match name' do
      let(:keyword) { '台積電' }
      it 'return true' do
        expect(portfolio.portfolio_stocks.find_by(stock: stock)).to be_nil
        expect { service }.to change(PortfolioStock, :count).by(1)
        expect(service).to be_truthy
        expect(portfolio.portfolio_stocks.find_by(stock: stock)).to be_present
      end
    end

    context "when keyword didn't name or ticker" do
      let(:keyword) { '不存在' }
      it 'return false' do
        expect(portfolio.portfolio_stocks.find_by(stock: stock)).to be_nil
        expect { service }.to change(PortfolioStock, :count).by(0)
        expect(service).to be_falsey
        expect(portfolio.portfolio_stocks.find_by(stock: stock)).to be_nil
      end
    end

    context "when keyword match a following stock" do
      let(:keyword) { 2330 }
      it 'return false' do
        PortfolioStock.create(portfolio: portfolio, stock: stock)
        expect { service }.to change(PortfolioStock, :count).by(0)
        expect(service).to be_falsey
        expect(portfolio.portfolio_stocks.find_by(stock: stock)).to be_present
      end
    end

    context "when keyword match a non-following stock and match another stock" do
      let(:keyword) { 2412 }
      it 'return false' do
        PortfolioStock.create(portfolio: portfolio, stock: stock)
        expect { service }.to change(PortfolioStock, :count).by(1)
        expect(service).to be_truthy
        expect(portfolio.portfolio_stocks.find_by(stock: stock)).to be_present
      end
    end
  end
end
