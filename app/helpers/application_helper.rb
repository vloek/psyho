module ApplicationHelper
  
  def resource_name
    :user
  end
   
  def resource
    @resource ||= User.new
  end
   
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def catalog tree, html=''
    children = tree.children

    if children.length > 0
      html << '<li>' + link_to(tree.name, :controller => :categories, :action => :index, :id => tree.id) + '<ul>' if !tree.root?
      for child in children 
        html << catalog(child, '')
      end
      html << '</ul></li>' if !tree.root?
    else
      html << '<li>' + link_to(tree.name, :controller => :units, :action => :index, :cat => tree.id) + '</li>'
    end
    return html
  end
  
end
