def add_space(title, price, description)
  click_button('Add space')
  fill_in('title', with: title)
  fill_in('price', with: price)
  fill_in('description', with: description)
  click_button('Create space')
end