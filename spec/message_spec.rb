require 'minitest/autorun'

require_relative '../lib/porkpie/message.rb'

describe Porkpie::Message do

  subject { Porkpie::Message.new 'EZ_KEY%%TYPE%%NAME%%VALUE' }

  it 'extracts values' do
    subject.values.must_equal ['EZ_KEY', 'TYPE', 'NAME', 'VALUE']
  end

  describe 'value accessors' do

    it '#ez_key' do
      subject.ez_key.must_equal 'EZ_KEY'
    end

    it '#type' do
      subject.type.must_equal 'TYPE'
    end

    it '#name' do
      subject.name.must_equal 'NAME'
    end

    it '#value' do
      subject.value.must_equal 'VALUE'
    end

  end

end
