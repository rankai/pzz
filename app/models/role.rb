class Role < ActiveRecord::Base
  has_and_belongs_to_many :pzz_users, :join_table => :pzz_users_roles
  belongs_to :resource, :polymorphic => true
  
  scopify
end
