class ContactsController < ApplicationController
  def index
      @contacts = Contact.all
    end

    def show
      @contact = Contact.find_by(id: params[:id])
    end

    def new
      
    end

    def create
      contact = Contact.new(
                            first_name: params[:first_name], 
                            last_name: params[:last_name], 
                            email: params[:email], 
                            phone_number: params[:phone_number]
                            )
      contact.save
      flash[:success] = "Contact created."
      redirect_to "/contacts/#{contact.id}"
    end

    def edit
      @contact = Contact.find_by(id: params[:id])
    end

    def update
      contact = Contact.find_by(id: params[:id])
      contact.assign_attributes(
                                first_name: params[:first_name], 
                                last_name: params[:last_name], 
                                email: params[:email], 
                                phone_number: params[:phone_number]
                                )
      contact.save
      flash[:success] = "Contact updated."
      redirect_to "/contacts/#{@contact.id}"
    end

    def destroy
      @contact = Contact.find_by(id: params[:id])
      @contact.destroy
      flash[:warning] = "Contact deleted."
      redirect_to "/"
    end
end

# 
# 1) we will need an action = url and a method = verb in our form in order to start using the search bar in the nav. 
# 2) replace the form with a form tag in printing skull tags with a do loop.  
# 3) By the input replace second deal with name and change to search_term
# 4) got to the index controller and search_term = params(:search_term), if search_term, @contacts = @contacts.where( "first_name", iLIKE ?" "%#{search_term}%"
