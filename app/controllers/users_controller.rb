class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |users| users.to_pleasant_string }.join("\n")
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
    new_user = User.create(
      user_name: name,
      user_email: email,
      user_password: password,
    )
    response_text = "Hey! Your New User is created in the Database by the id  #{new_user.id}"
    render plain: response_text
  end
  
  def update
    id = params[:id]
    password = params[:password]
    users = User.find(id)
    users.save!
    render plain: " Hey ! Users Password is Updated"
  end
  
  def login
    email = params[:email]
    password = params[:password]
    #find_by(arg, *args)
    #Finds the first record matching the specified conditions. 
    #There is no implied ordering so if order matters, you should specify it yourself.
    #If no record is found, returns nil
    user = User.find_by(user_email: email, user_password: password)
    render plain: user.present?
  end
end
