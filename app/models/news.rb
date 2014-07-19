class News < ActiveRecord::Base
  paginates_per 10
  
  # collection_action :index, :method => :get do
  #   scope = News.scoped
  #   @collection = scope.page() if params[:q].blank?
  #   @search = scope.metasearch(clean_search_params(params[:q]))
  # end
  
  def to_param
    [id, head.parameterize].join("-")
  end


  def next
    News.where("id > ?", id).order("id ASC").first
  end

  def prev
    News.where("id < ?", id).order("id DESC").first
  end
end
