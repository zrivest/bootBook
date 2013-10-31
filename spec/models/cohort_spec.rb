require 'spec_helper'

describe Cohort do
  context "#initialize" do
    it "Cohort is valid if cohort_name, start_date and end_date are provided" do
      cohort = FactoryGirl.build(:cohort)
      expect(cohort).to be_valid   
    end

    it "Cohort is invalid without a cohort_name" do
      cohort = FactoryGirl.build(:cohort, cohort_name: nil)
      expect(cohort).to_not be_valid
    end

    it "Cohort is invalid without a start date" do
      cohort = FactoryGirl.build(:cohort, start_date: nil)
      expect(cohort).to_not be_valid
    end

    it "Cohort is invalid without an end date" do
      cohort = FactoryGirl.build(:cohort, end_date: nil)
      expect(cohort).to_not be_valid
    end
  end
  context "#associations" do
    it "Cohort has many students" do
      cohort = FactoryGirl.build(:cohort)
      cohort.students << FactoryGirl.create(:user)
      expect(cohort.students.empty?).to_not be_true
    end
  end
end
