class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    #render plain: "The id you wanted was #{id}"
    users = User.find(id)
    render plain: users.to_pleasant_string
  end

  def create
    #render plain: "Hey, this is the the create action!"
    new_user = User.create!(
      user_name: params[:user_name],
      user_email: params[:user_email],
      user_password: params[:user_password],
    )
    response_text = "Hey! Your New User is created in the Database by the id  #{new_user.id}"
    render plain: response_text
        #render plain: "hey, the params are: #{params.to_s}"
  end
  def update
    id = params[:id]
    user_password = params[:user_password]
    users = User.find(id)
    todo.completed = completed
    users.save!
    render plain: " Hey ! Users Password is Updated and the status to #{user_password}"
  end
  def login
    user_email = params[:user_email]
    user_password = params[:user_password]
    user_response = User.find_by(user_email: user_email, user_password: user_password)
    render plain: user_response
  end
end
