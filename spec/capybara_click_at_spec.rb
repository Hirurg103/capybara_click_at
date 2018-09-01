RSpec.describe CapybaraClickAt do

  before { visit '/index.html' }

  shared_context "with JS driver" do |driver|

    context "with JavaScript driver #{driver}", driver: driver do

      it 'clicks at point in the document' do
        click_at(5, 5)

        expect(page).to have_content 'Document clicked at (5, 5)'
      end

      it 'clicks at point in the container specified by a CSS selector' do
        click_at(5, 5, css: '#container')

        expect(page).to have_content 'Container clicked at (5, 5)'
      end

      it 'clicks at point in the container specified by a XPath selector' do
        click_at(5, 5, xpath: '//div[@id="container"]')

        expect(page).to have_content 'Container clicked at (5, 5)'
      end

    end
  end

  include_context 'with JS driver', :selenium
  include_context 'with JS driver', :webkit
  include_context 'with JS driver', :poltergeist

end
