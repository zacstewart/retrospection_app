require 'spec_helper'

describe 'Retrospections resource' do
  context 'with a registered user' do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in user }

    context 'with retrospection existing on date' do
      let(:date) { Date.today }
      let!(:retrospection) { FactoryGirl.create(:retrospection, retrospected_on: date, user: user) }
      describe 'show' do
        it 'should show the retrospection' do
          visit retrospection_path(date.to_s)
          expect(page).to have_content('Binks ate a ladybug today')
        end
      end

      describe 'edit' do
        it 'should render edit form' do
          visit edit_retrospection_path(date.to_s)
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
      let(:date) { '2010-01-01' }
      describe 'show' do
        it 'should render edit form' do
          visit retrospection_path(date)
          expect(page).to have_selector('form#new_retrospection')
        end
      end
    end
  end

  context 'without a registered user' do
    let(:date) { '2010-10-26' }
    let(:body) { 'Binks ate a ladybug today' }

    context 'without retrospection existing on date' do
      describe 'show' do
        it 'should render edit form' do
          visit retrospection_path(date)
          expect(page).to have_selector('form#new_retrospection')
        end

        it 'should let the anonymous user create a new retrospection' do
          visit retrospection_path(date)
          fill_in 'Body', with: body
          click_on 'Create Retrospection'
          expect(page).to have_content(body)
        end
      end
    end
  end
end
