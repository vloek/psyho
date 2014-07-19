class NewsController < ApplicationController
  before_action :set_news, only: [:show]
  before_action :set_news_for_calendar, only: [:index]
  # GET /news
  # GET /news.json
  def index
    if params[:date].present?
      @search = News.search({date_gt: Time.parse(params[:date]).beginning_of_day, date_lt: Time.parse(params[:date]).end_of_day})
    elsif params[:month].present?
      @search = News.search({ date_gt: Time.parse(params[:month]).beginning_of_month, date_lt: Time.parse(params[:month]).end_of_month})
    else 
      @search = News.order("date desc").search()
    end
    @news = @search.result.page(params[:page])
    # @news = @news.where("created_at = ?", params[:date].to_date) if params[:date]
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # # GET /news/new
  # def new
  #   @news = News.new
  # end
  # 
  # # GET /news/1/edit
  # def edit
  # end

  # POST /news
  # POST /news.json
  # def create
  #   @news = News.new(news_params)
  # 
  #   respond_to do |format|
  #     if @news.save
  #       format.html { redirect_to @news, notice: 'News was successfully created.' }
  #       format.json { render :show, status: :created, location: @news }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @news.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  # def update
  #   respond_to do |format|
  #     if @news.update(news_params)
  #       format.html { redirect_to @news, notice: 'News was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @news }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @news.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /news/1
  # DELETE /news/1.json
  # def destroy
  #   @news.destroy
  #   respond_to do |format|
  #     format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end
    
  def set_news_for_calendar
    #@news_calendar = params[:month] ? News.search({ date_gt: params[:month].to_date.beginning_of_month, date_lt: params[:month].to_date.end_of_month}).result.to_a : News.last(100
    #@news_calendar = News.where("date > ? AND date < ?", Time.parse(params[:month]).beginning_of_month, Time.parse(params[:month]).end_of_month)
    if params[:month].present?
      @news_cal = News.search({ date_gt: Time.parse(params[:month]).beginning_of_month, date_lt: Time.parse(params[:month]).end_of_month}).result
    else
      @news_cal = News.last(200)
    end
    #@news_calendar = News.all
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def news_params
    #   params.require(:news).permit(:date, :title, :keywords, :description, :url, :head, :anounce, :body, :status)
    # end
end
