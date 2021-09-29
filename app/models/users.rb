class User < ActiveRecord::Base
  def to_pleasant_string
    "#{id} #{user_name} #{user_email} #{user_password}"
  end
end
