class ApplicationController < ActionController::Base
  before_filter :set_locale, :set_top_menu, :set_left_menu
  protect_from_forgery with: :exception


  def access_denied exception
      # redirect_to Pages, :alert => exception.message
      flash[:notice] = "You are not authorized to access this resource!"
      redirect_to root_path
  end
  # def authenticate_active_admin_user!
  #     authenticate_user!
  #     unless current_user.role?(:admin)
  #         flash[:alert] = "You are not authorized to access this resource!"
  #         redirect_to root_path
  #     end
  # end
  
  def set_locale
    I18n.locale =  params[:locale] || I18n.default_locale  || extract_locale_from_accept_language_header
  end


  def set_top_menu
    @top_items = Page.top_menu
  end

  def set_left_menu
    @left_items = Page.left_menu
  end


#  def set_news_for_calendar
    #@news_calendar = params[:month] ? News.search({ date_gt: params[:month].to_date.beginning_of_month, date_lt: params[:month].to_date.end_of_month}).result.to_a : News.last(100) 
    #@news_calendar = params[:month].present? ? News.where("date > ? AND date < ?", Time.parse(params[:month]).beginning_of_month, Time.parse(params[:month]).end_of_month) : News.last(100)
#    if params[:month].present?
#      @news_calendar = News.search({ date_gt: Time.parse(params[:month]).beginning_of_month, date_lt: Time.parse(params[:month]).end_of_month}).result.page(params[:page]) || News.last(100)
#    else
#      @news_calendar = News.last(200)
#    end
    #@news_calendar = News.all
 # end
  
  def default_url_options(options={})
    { :locale => I18n.locale }
  end
  
  def get_categories
    @categories = Category.root
  end
  
  
  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

end
