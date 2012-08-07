require 'minitest/autorun'

require_relative '../lib/porkpie/stathat.rb'

describe Porkpie::StatHat do

  it 'has a api endpoint' do
    Porkpie::StatHat.endpoint.must_equal 'http://api.stathat.com/ez'
  end

  describe Porkpie::StatHat::Request do

    let(:params) {Hash[ :ez_key => '1234', :name => 'a-value', :value => '9.2' ] }

    it 'is initialized with with params' do
      request = Porkpie::StatHat::Request.new params

      request.params.must_equal params
    end

    it 'has a endpoint_uri that is a URI::HTTP' do
      request = Porkpie::StatHat::Request.new
      request.endpoint_uri.must_be_instance_of URI::HTTP
    end

    it 'posts to StatHat api when performed' do
      request = Porkpie::StatHat::Request.new
      client = MiniTest::Mock.new
      client.expect :post_form, true, [ request.endpoint_uri, request.params ]

      request.perform client

      client.verify
    end

  end

  describe Porkpie::StatHat::Response do

    it 'is initialized with a reponse object' do
      response = Porkpie::StatHat::Response.new 'hello'
      response.http_response.must_equal 'hello'
    end

    it 'is valid if status is 200' do
      response = Porkpie::StatHat::Response.new Struct.new(:code).new("200")
      response.valid?.must_equal true
    end

    it 'is not valid if status is 500' do
      response = Porkpie::StatHat::Response.new Struct.new(:code).new("500")
      response.valid?.must_equal false
    end

  end

end
