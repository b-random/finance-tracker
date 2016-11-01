class StocksController < ApplicationController
   
  def search
    if params[:stock] # if params from the stock model are present...
      @stock = Stock.find_by_ticker(params[:stock]) # save params from an instance of the stocks table first, if found...
      @stock ||= Stock.new_from_lookup(params[:stock]) # or look the stock up and save as @stock
    end
    
    if @stock
      #render json: @stock # json allows you to test functionality on the fly & in browser
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end
  end
    
end