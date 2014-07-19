class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  before_create :default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end
  
  private
    def default_role
     self.roles = self.roles || [Role.find_by_name(:registered)]
    end
  
end
