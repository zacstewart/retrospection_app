require 'spec_helper'

describe 'Retrospections resource' do
  context 'with retrospection existing on date' do
    before do
      @date = Date.today
      FactoryGirl.create(:retrospection, retrospected_on: @date)
    end

    describe 'show' do
      it 'should show the retrospection' do
        visit retrospection_path(@date.to_s)
        expect(page).to have_content('Binks ate a ladybug today')
      end
    end

    describe 'edit' do
      it 'should render edit form' do
        visit edit_retrospection_path(@date.to_s)
        expect(find('textarea#retrospection_body')).to have_content('Binks ate a ladybug today')
      end
    end

    describe 'search' do
      it 'should render a list of retrospections matching the query' do
        visit retrospections_path(q: 'ladybug')
        expect(page).to have_content('Binks ate a ladybug today')
      end
    end
  end

  context 'without retrospection existing on date' do
    describe 'show' do
      it 'should render edit form' do
        visit retrospection_path('2010-10-26')
        expect(page).to have_selector('#new_retrospection')
      end
    end
  end
end
