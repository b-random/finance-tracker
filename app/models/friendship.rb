class Friendship < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :friend, :class_name => 'User'
    #This is a many to many relationship
    #There is no 'Friend' MVC.  A friend to user assoc., is just a user to user assoc. See user.rb
    
end
