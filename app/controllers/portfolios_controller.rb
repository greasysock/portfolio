class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :destroy, :show]
  before_action :use_unsafe_params, only: [:sort]
  access all: [:show, :index], site_admin: :all
    def index
        @portfolio_items = Portfolio.by_position
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_params)
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
          else
            format.html { render :new }
          end
        end
      end

    def new
        @portfolio_item = Portfolio.new
    end

    def edit
    end

    def update
        respond_to do |format|
            if @portfolio_item.update(portfolio_params)
              format.html { redirect_to portfolios_path, notice: 'Portfolio entry was updated successfully!' }
            else
              format.html { render :edit }
            end
          end
    end

    def sort
      @_dangerous_params[:order].each do |key, value|
        Portfolio.find(value[:id]).update!(position: value[:position])
      end
      head 200, content_type: "text/html"    end

    def show
    end

    def destroy
      @portfolio_item.destroy

      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Portfolio entry was remove' }
      end
    end

    private

    def portfolio_params
      params.require(:portfolio).permit(:title, 
        :subtitle, 
        :body,
        :main_image,
        :thumb_image,
        :project_url,
        technologies_attributes: [:name, :id, :_destroy])
    end
    
    def set_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end

    def use_unsafe_params
      @_dangerous_params = request.parameters
    end
end
