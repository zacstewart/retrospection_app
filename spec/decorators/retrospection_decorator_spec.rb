require 'spec_helper'

describe RetrospectionDecorator do
  before do
    retrospection = stub_model(Retrospection, body: '# This is my final form')
    @retrospection = RetrospectionDecorator.decorate(retrospection)
  end
  
  describe '#body_html' do
    it 'should render markdown as html' do
      expect(@retrospection.body_html).to match('<h1>')
    end
  end
end
