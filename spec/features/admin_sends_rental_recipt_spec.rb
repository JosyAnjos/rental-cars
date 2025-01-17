require 'rails_helper'

feature 'Admin sends rental recipt through email' do
  
  scenario 'successfully' do
    
    user = create(:user)
    car = create(:car, subsidiary: user.subsidiary)
    customer = create(:customer, cpf: "123456789" )  
    sent_mail = class_spy(RentalMailer)
    stub_const("RentalMailer", sent_mail)
    login_as user
    
    visit root_path
    click_on 'Registrar Locação'
    select "#{car.car_identification}", from: 'Carro'
    select "#{customer.cpf_name}", from: 'Cliente'
    click_on 'Enviar'
    
    expect(page).to have_content('Um email de confirmação foi enviado para o '\
    'cliente')
    expect(RentalMailer).to have_received(:send_rental_receipt).with(Rental.last.id)
  end
end