class HomeController < ApplicationController
  def index
    @extract = Cash.all
  end
end
