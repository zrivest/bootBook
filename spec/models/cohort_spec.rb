require 'spec_helper'

describe Cohort do
  context "#initialize" do
    it "Cohort is valid if cohort_name, start_date and end_date are provided" do
      expect(Cohort.new(cohort_name: "Ocelots", start_date: "2012-01-01", end_date: "2012-05-01")).to be_valid   
    end

    it "cohort is invalid without a name" do
      expect(Cohort.new(cohort_name: nil, start_date: "2012-01-01", end_date: "2012-05-01")).to_not be_valid
    end

    it "cohort is invalid without a start date" do
      expect(Cohort.new(cohort_name: "Ocelots", start_date: nil, end_date: "2012-05-01")).to_not be_valid
    end

    it "cohort is invalid without an end date" do
      expect(Cohort.new(cohort_name: "Ocelots", start_date: "2012-01-01", end_date: nil)).to_not be_valid
    end
  end
end
