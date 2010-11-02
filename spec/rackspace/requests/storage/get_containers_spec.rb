require File.dirname(__FILE__) + '/../../../spec_helper'

describe 'Rackspace::Storage.get_containers' do
  describe 'success' do

    before(:each) do
      unless Fog.mocking?
        Rackspace[:storage].put_container('container_name')
      end
    end

    after(:each) do
      Rackspace[:storage].delete_container('container_name')
    end

    it "should return proper attributes" do
      pending if Fog.mocking?
      actual = Rackspace[:storage].get_containers.body
      actual.first['bytes'].should be_an(Integer)
      actual.first['count'].should be_an(Integer)
      actual.first['name'].should be_a(String)
    end

  end
end
