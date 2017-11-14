require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do

  company = Company.create!(name: 'ab', plan_level: 'basic', trial_status: Time.zone.now)
  company1 = Company.create!(name: 'bc', plan_level: 'legacy', trial_status: Time.zone.now)
  company2 =  Company.create!(name: 'cd', plan_level: 'custom', trial_status: Time.zone.now)

  describe "#index" do
    it "returns all companies" do
      get :index
      data = JSON.parse(response.body)
      ids = data["data"].map!{|d| d["id"]}
      expect(data["data"].length).to eq(Company.count)
      expect(ids).to match_array(Company.pluck(:id))
    end
  end

  describe "#alphabetical" do
    it "returns all companies in alphabetical order" do
      get :alphabetical
      data = JSON.parse(response.body)
      names = data["data"].map!{|d| d["name"]}
      expect(data["data"].length).to eq(Company.count)
      previous_name = ""
      names.each do |name|
        expect(previous_name <= name).to eq(true)
        previous_name = name
      end
    end
  end

  describe "#with_modern_plan" do
    it "returns all plans with a modern plan level" do
      get :with_modern_plan
      data = JSON.parse(response.body)
      plan_levels = data["data"].map!{|d| d["plan_level"]}
      expect(data["data"].length).not_to eq(Company.count)
      plan_levels.each do |pl|
        expect(Company::MODERN_PLANS.include?(pl)).to eq(true)
      end
    end
  end
end
