class HomeController < ApplicationController
  def index
    @extract = Cash.all
    
    @extract = Cash.where("tipo like ?", "%#{params[:tipo]}%") if params[:tipo].present?

    @total_value = 0
    @revenues = 0
    @expenses = 0

    @extract.each do |item|
      if item.status == Cash::DEBT
        @expenses += item.value
      else
        @revenues += item.value

      end
    end
    @total_value = @revenues - @expenses
  end
end
