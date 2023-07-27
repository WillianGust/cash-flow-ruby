class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    extract = Cash.all
    
    extract = Cash.where("tipo like ?", "%#{params[:tipo]}%") if params[:tipo].present?

    total_value = 0
    revenues = 0
    expenses = 0

    extract.each do |item|
      if item.status == Cash::DEBT
        expenses += item.value
      else
        revenues += item.value

      end
    end
    total_value = revenues - expenses

    render json: {
      total_value: total_value,
      revenues: revenues,
      expenses: expenses,
      extract: extract
      
    }
  end

  def delete
    Cash.delete(params[:id])
    render json: {}, status: 204
  end

  # Only to show form
  def add
  end

  def register
    cash = Cash.create(tipo: params[:tipo], value: params[:value], status: params[:status])
    render json: cash.to_json, status: 201
  end
end
