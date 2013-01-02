class Environment < ActiveRecord::Base
  attr_accessible :comment, :name, :usage
  validates_presence_of :name, :on => :create, :message => "Can't be blank"
  validates_presence_of :usage, :on => :create, :message => "Can't be blank"

  @@usages = ["Production Train", "Demo", "Test", "Free"]

  def self.usages
  	@@usages
  end

end