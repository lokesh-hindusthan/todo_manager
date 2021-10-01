class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      user_name: name,
      user_email: email,
      user_password: password,
    )
    response_text = "Hey! Your New User is created in the Database by the id  #{new_user.id}"
    render plain: response_text
  end
  
   def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(user_email: email, user_password: password)
    render plain: user.present?
  end
  
end
