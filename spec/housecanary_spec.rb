# frozen_string_literal: true

require 'spec_helper'

describe ::Housecanary do
  context 'when gem version is available' do
    it 'has a version number' do
      expect(Housecanary::VERSION).not_to be nil
    end
  end

  context 'configuring' do
    describe '#configure' do
      before :all do
        Housecanary.configure do |config|
          config.api_key = 'my_another_api_key'
          config.api_secret = 'my_another_api_secret'
        end
      end
      let(:container) { Housecanary.container }

      it 'configures Dry::Container Registry' do
        expect(container['connection']).to be_an_instance_of(Housecanary::Connection)
        expect(container['response_parser']).to be(Housecanary::ResponseParser)
      end
      it 'configures connection' do
        expect(container['connection'].api_key).to eq('my_another_api_key')
        expect(container['connection'].api_secret).to eq('my_another_api_secret')
      end
    end
  end
end
