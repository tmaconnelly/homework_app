class CompaniesController < ApplicationController
  def index
    render json: { data: Company.all }
  end

  def alphabetical
    render json: { data: Company.alphabetical }
  end

  def with_modern_plan
    render json: { data: Company.with_modern_plan }
  end
end
