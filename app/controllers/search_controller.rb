class SearchController < ApplicationController
  # search by one criteria at a time
  def new_search

    if !params[:postal].nil? && !params[:postal].strip.empty?
      @search_results = Review.search(postalcode: params[:postal])
    elsif !params[:cuisine].nil? && !params[:cuisine].strip.empty?
      @search_results = Review.search(cuisine: params[:cuisine])
    elsif !params[:price].nil? && !params[:price].strip.empty?

      if params[:price] == '10'
        @search_results = Review.where(price: 0..params[:price].to_i)
      elsif params[:price] == '20'
        @search_results = Review.where(price: 10..params[:price].to_i)
      elsif params[:price] == '21+'
        @search_results = Review.where(price: 20..100000)
      end
    elsif !params[:rating].nil? && !params[:rating].strip.empty?
      @search_results = Review.where(rating: params[:rating])
    else
      @search_results = Review.all
    end
    render :search_by
  end #def new_search

  def search_by
    @search_results = Review.all
  end

  def search_all

  end

  def cuisine

  end


  def location
    # @reviews = Review.where(postalcode: params[:postal])

  end

  def rating
    # @reviews = Review.where(rating: params[:rating])

  end

  def price

  end
end #end Class



# #def new_search
# # if there's a cuisine param, put it into an instance variable and send the user to the page that shows the results
# # if there's a postal/location param, put it into an instance variable and send the user to the page that shows the results
# # if there's a price param, put it into an instance variable and sent the user to the page that shows the results
# # if there's a rating param, put it into an instance variable and send the user to the page that shows the results
# # ELSE, show all the reviews on the index page
# #end
