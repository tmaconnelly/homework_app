require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe "#index" do
    #this should probably be put into a factory
    company = Company.create(name: 'a', plan_level: 'basic', trial_status: Time.zone.now)
    company1 = Company.create(name: 'b', plan_level: 'basic', trial_status: Time.zone.now)
    company2 =  Company.create(name: 'c', plan_level: 'basic', trial_status: Time.zone.now)

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
        expect(previous_name < name)
        previous_name = name
      end
    end
  end
end
