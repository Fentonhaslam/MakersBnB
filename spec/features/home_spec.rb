feature 'test homepage' do
  scenario 'Can show hello World' do
    visit('/')
    expect(page).to have_content('Hello world')
  end
end