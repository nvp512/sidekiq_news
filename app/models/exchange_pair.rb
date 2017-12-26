class ExchangePair < ActiveRecord::Base
  belongs_to :exchanges
  belongs_to :pairs
end
