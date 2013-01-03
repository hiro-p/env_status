class User < ActiveRecord::Base
  attr_accessible :username, :provider, :uid, :token

  def self.create_with_omniauth(auth)  
    create! do |user|  
      user.provider = auth["provider"]  
      user.uid = auth["uid"]  
      user.username = auth["user_info"]["name"]  
    end  
  end  
end