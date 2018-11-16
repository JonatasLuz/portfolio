class PortfoliosController < ApplicationController
	def index
		@portfolios_items = Portfolio.all
	end
	def new
		@portfolio_item = Portfolio.new
	end
	def create
  		@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title,:subtitle, :body))
    	respond_to do |format|
      		if @portfolio_item.save
        		format.html { redirect_to portfolios_path, notice: 'Portfolio criado com sucesso.' }
        		format.json { render :show, status: :created, location: @portfolio }
      		else
        		format.html { render :new }
        		format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      		end
    	end
 	end
end