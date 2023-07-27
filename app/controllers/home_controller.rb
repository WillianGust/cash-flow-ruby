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

  def delete
    Cash.delete(params[:id])
    redirect_to "/"
  end

  # Only to show form
  def add
  end

  def register
    Cash.create(tipo: params[:tipo], value: params[:value], status: params[:status])
    redirect_to "/"
  end
end
