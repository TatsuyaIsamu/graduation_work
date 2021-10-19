class ContactsController < ApplicationController

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver 
      redirect_to @contact, notice: "送信しました"
    else
      if @contact.email.blank?
        flash.now[:alert] = "Emailアドレスを入力して下さい"
      else
        flash.now[:alert] = "Emailアドレスが不正です"
      end
      render :new
    end
  end
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
