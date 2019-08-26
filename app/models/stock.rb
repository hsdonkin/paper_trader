require 'googlecharts'
class Stock < ApplicationRecord
  has_many :values
  has_many :users, through: :portfolios
  has_many :trades


  def create_chart
    chart = Gchart.line(:size => '800x600',
              :title => "example title",
              :legend => ['first data set label', 'second data set label'],
              :data => [10, 30, 120, 45, 72])
    binding.pry
    chart.file
  end


end
