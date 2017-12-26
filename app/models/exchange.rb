class Exchange < ActiveRecord::Base
  has_many :exchange_pairs
  has_many :pairs, through: :exchange_pairs
end
