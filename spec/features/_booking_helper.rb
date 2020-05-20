
def add_booking
  visit('/makersbnb/add-space')
  fill_in 'name', with: 'Room'
  fill_in 'description', with: 'Room Description'
  fill_in 'price', with: 50.00
  select 'March', from: 'start_month'
  select '1', from: 'start_day'
  select 'April', from: 'start_month'
  select '1', from: 'start_day'
  click_button 'Add Space'
end
