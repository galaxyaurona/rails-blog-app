class PortfoliosController < ApplicationController
    before_action :set_portfolio, only: [:edit, :destroy, :show, :update]
    def index
        @portfolios = Portfolio.all
    end
    
    def show
    end
        
    def new 
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end

    
    def create
        @portfolio_item = Portfolio.new(portfolio_params)
        respond_to do |format|
            if @portfolio_item.save
                format.html { redirect_to portfolios_path, notice: 'Portfolios was successfully created.' }
                format.json { render :show, status: :created, location: @portfolio_item }
            else
                format.html { render :new }
                format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
            end
        end
        
    end
    
    def edit
    
    end
    
    def update
    
        print @portfolio.as_json
        respond_to do |format|
            if  @portfolio.update(portfolio_params)
                format.html { redirect_to @portfolio, notice: 'Portfolios was successfully update.' }
                format.json { render :show, status: :created, location: @portfolio }
            else
                format.html { render :edit }
                format.json { render json: @portfolio.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        @portfolio.destroy
        respond_to do |format|
            format.html {redirect_to portfolios_path, notice: "delete record " }
            format.json { render json: {success:true}}
        end    
    end
    
    private
        def portfolio_params
            params.require(:portfolio).permit(:title,:subtitle,:body, technologies_attributes: [:name])
        end
        
        def set_portfolio
            @portfolio = Portfolio.find(params[:id])
        end
end
