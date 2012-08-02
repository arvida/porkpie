require 'minitest/autorun'

require_relative '../lib/porkpie/config.rb'

describe Porkpie::Config do

  subject { Porkpie::Config }

  it 'has default values' do
    subject.host.must_equal '127.0.0.1'
    subject.port.must_equal 5432
    subject.pid_file.must_equal '/var/run/porkpie.pid'
    subject.log_file.must_equal nil
  end

  it 'has setters for values' do
    subject.host = '10.0.0.1'
    subject.host.must_equal '10.0.0.1'
  end

end
