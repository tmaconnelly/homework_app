require "rails_helper"

describe Company do
  describe "creating a new company" do
    context "when all required values are present" do
      it "successfully saves" do
        company = Company.new(name: "test", plan_level: "basic", trial_status: Time.zone.now)
        expect do
          company.save!
        end.to change{ Company.count }.by(1)
      end
    end

    context "name validations" do
      it "throws an error when name is not present" do
        company = Company.new(plan_level: "basic", trial_status: Time.zone.now)
        expect do
          company.save!
        end.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "throws an error when name is too short" do
        company = Company.new(name: "a", plan_level: "basic", trial_status: Time.zone.now)
        expect do
          company.save!
        end.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "throws an error when name is too long" do
        company = Company.new(name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", plan_level: "basic", trial_status: Time.zone.now)
        expect do
          company.save!
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context "plan_level validations" do
      it "throws an error when plan_level is not present" do
        company = Company.new(name: "test", trial_status: Time.zone.now)
        expect do
          company.save!
        end.to raise_error(ActiveRecord::RecordInvalid)
      end

      it "throws an error when plan_level is not in valid list of plan levels" do
        company = Company.new(name: "test", plan_level: "badvalue", trial_status: Time.zone.now)
        expect do
          company.save!
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
