require 'rails_helper'

describe 'Language Landing Page' do
  before do
    create(:article)
    create(:article, :spanish)
    create(:article, :german)
    create(:article, :danish)
    create(:article, :finnish)
    create(:article, :french)
    create(:article, :greek)
    create(:article, :hebrew)
    create(:article, :italian)
    create(:article, :swedish)
    create(:article, :turkish)
    create(:article, :portuguese)
    create(:article, :portuguese_br)
  end

  it 'has a link for every language' do
    visit '/languages'

    within '#locales' do
      links = all('a')
      expect(links.count).to eq Article.count
    end
  end

  it 'Renders the landig page with counts and links to specific languages' do
    visit '/languages'
    link_matcher = 'a[href*="languages/"]'
    links = all(link_matcher)
    links_text = links.map(&:text)

    links_text.each do |text|
      click_on text, match: :first
      expect(page).to have_content text
      visit '/languages'
    end
  end
end
