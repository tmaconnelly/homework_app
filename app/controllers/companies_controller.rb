class CompaniesController < ApplicationController
  def index
    render json: { data: Company.all }
  end

  def alphabetical
    render json: { data: Company.alphabetical }
  end
end
