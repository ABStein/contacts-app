class ContactsController < ApplicationController
  def one_contact_action
    @contact = Contact.first
    render 'one_contact_page.html.erb'
  end

  def all_contacts_action
    @contacts = Contact.all 
    render 'all_contacts_page.html.erb'
  end
end
