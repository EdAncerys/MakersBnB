require_relative '../web_helper'

feature 'request space' do

  scenario 'user can request a space' do
    sign_up
    log_in
    add_space
    click_button 'Request to Book Space'
    # select 'Sun 01 Mar 2020', from: 'request_date'
    select 'Sun 01 Mar 2020', :from => 'request_date'
    click_button 'Request Space'
  end

  scenario 'user can access request page' do
    sign_up
    log_in
    add_space
    click_button 'Request to Book Space'
    expect(page).to have_content 'Request to book a space:'
  end

  scenario 'user can request to book a space' do
    sign_up
    log_in
    add_space
    # log_out?
    sign_up_customer
    log_in_customer
    click_button 'Request to Book Space'
    select 'Sun 01 Mar 2020', from: 'request_date'
    click_button 'Request Space'

    visit('/requests-customer')
    expect(page).to have_content 'Sun 01 Mar 2020'
  end

  scenario 'as a landlord able to see the requests' do
    sign_up
    log_in
    add_space

    sign_up_customer
    log_in_customer
    click_button 'Request to Book Space'
    select 'Sun 01 Mar 2020', from: 'request_date'
    click_button 'Request Space'

    log_in

    visit('/requests-landlord')
    expect(page).to have_content 'Sun 01 Mar 2020'
  end


  scenario 'as a landlord able to accept requests' do
    # sign_up
    # log_in
    # add_space

    # sign_up_customer
    # log_in_customer
    # click_button 'Request to Book Space'
    # select 'Sun 01 Mar 2020', from: 'request_date'
    # click_button 'Request Space'

    # log_in

    # visit('/requests-landlord')
    # select 'Approve Request', from: 'approve_or_deny'
    # click_button 'Submit'
    # expect(page).to have_content 'Request Approved'

    # log_in_customer
    # visit('/requests-customer')
    # expect(page).to have_content 'Request Approved'
  end


end
