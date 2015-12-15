class User < ActiveRecord::Base
  has_secure_password

  has_many :todos

  def self.authenticate!(params)
    return NullUser unless params["email"] && params["password"]
    return NullUser unless user = User.find_by_email(params["email"])
    user.authenticate(params["password"]) || NullUser
  end

  def token
    JWT.encode({email: email}, nil, "none")
  end
end
