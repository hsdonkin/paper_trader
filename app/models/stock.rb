require 'googlecharts'
class Stock < ApplicationRecord
  has_many :values
  has_many :users, through: :portfolios
  has_many :trades




end
