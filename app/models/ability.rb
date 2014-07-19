class Ability
  include CanCan::Ability
 
  def initialize(user)
    user ||= User.new # guest user
    if user.role? :admin
      can :manage, :all
    elsif user.role? :editor
      can :manage, [Page, Unit, Category, News]
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    elsif user.role? :registered
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    end
  
  end
    
end