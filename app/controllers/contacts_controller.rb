class ContactsController < ApplicationController
  
  def index
    redirect_to new_contact_path
  end
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
      flash.now[:alert] = ""
      if @contact.email.blank?
        flash.now[:alert] << "Emailアドレスを入力して下さい。"
      else
        unless @contact.email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
          flash.now[:alert] << "Emailアドレスが不正です。"
        end
      end
      if @contact.name.blank?
        flash[:alert] << "名前を入力して下さい。"
      end
      if @contact.content.blank?
        flash[:alert] << "内容を入力して下さい。" 
      end
      render :new
    end
  end
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
  def forbid_from_confirm_reload
    if request.get?
      redirect_to new_contact_path and return
    end
  end
end
