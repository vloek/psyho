class CategoriesController < ApplicationController
  before_action :set_category, only: [:index]
  
  def index

  end
  
  # def show
  #   if @children.length!=0
  #     render action: 'index' 
  #   else
  #     redirect_to controller: 'units', action: index
  #   end
  #   # @units Category.units.page(params[:page])
  # end
  
  private
    def set_category
      @children = Category.where(:parent_id => params[:id] || Category.root.id).page(params[:page])
    end
    # def category_params
    #   # params.require(:category).permit(:id, :name, :url)
    # end
end
