class Stock < ActiveRecord::Base
  
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
  #This allows us to search the db table for the first instance of  ticker_symbol
    
  
  #These methods are not attached to any instance of a stock and no instances will be created for them to rely on... therefor they are class methods and use "self"  
  def self.new_from_lookup(ticker_symbol)
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)  
    return nil unless looked_up_stock.name
    
    new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
    new_stock.last_price = new_stock.price
    new_stock
  end
  
  #Now by typing Self.new_from_lookup('ticker_symbol') == Stock.new_from_lookup('aapl') and assuming the argument is correct and has a name, the symbol, name, and last price are returned.  The last_price is determined (in big decimal form) below, by the 'price' method, which returns either a close price, open price or unavailable.
  
  
  def price
    closing_price = StockQuote::Stock.quote(ticker).close #'close' only works after one day ends and before the next begins.  Once the new day has started 'previous_close' or 'open'(as in the price at open of day) must be used.
    return "#{closing_price} (Closing)" if closing_price #if !closing_price...
    opening_price = StockQuote::Stock.quote(ticker).open
    return "#{opening_price} (Opening)" if opening_price #if !opening_price either...
    'Unavailable'
  end
end
