require 'rails_helper'

RSpec.describe Lesson, type: :model do
  #this should probably be put into a factory
  company = Company.create(name: 'test', plan_level: 'basic', trial_status: Time.zone.now)
  describe "model validations" do
    context "when all fields are present" do
      it "successfully saves" do
        lesson = Lesson.new(name: "1st lesson", company: company, active: false)
        expect do
          lesson.save!
        end.to change{ Lesson.count }.by(1)
      end
    end

    context "when company is not present" do
      it "fails to save" do
        lesson = Lesson.new(name: "this is my first lesson", active: false)
        expect do
          lesson.save!
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context "when name contains non numeric characters" do
      it "fails to save" do
        lesson = Lesson.new(name: "$$$$@$!@!$@!$", company: company, active: false)
        expect do
          lesson.save!
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context "when name is not present" do
      it "fails to save" do
        lesson = Lesson.new(company: company, active: false)
        expect do
          lesson.save!
        end.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
