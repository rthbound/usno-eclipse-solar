require 'test_helper'

describe USNO::Eclipse::Solar::WorldWideRequest do
  before do
    @subject = USNO::Eclipse::Solar::WorldWideRequest
    @params = {
      city: "Greenwich Test",
      z_meters: 0,
      long:     30,
      lat:      87,
      date: 22017
    }
  end

  describe "as a class" do
    it "initializes properly" do
      @subject.new(@params).must_respond_to :call
    end

    it "errors when initialized without required dependencies" do
      -> { @subject.new(@params.reject { |k| k.to_s == 'lat' }) }.must_raise RuntimeError
      -> { @subject.new(@params.reject { |k| k.to_s == 'long' }) }.must_raise RuntimeError
    end
  end

  describe "as an instance" do
    it "executes successfully" do
      result = @subject.new(@params).call
      result.successful?.must_equal true
      result.data.must_include "Greenwich Test"
      result.must_be_kind_of PayDirt::Result
    end
  end
end
