class SearchController < ApplicationController

  def new_search
    @cuisine_searches = Review.where(cuisine: params[:cuisine])
    @location_searches = Review.where(postalcode: params[:postal])
    @price_searches = Review.where(price: params[:price])
    @rating_searches = Review.where(rating: params[:rating])

    if !@cuisine_searches.nil?
      render :cuisine
    elsif
      !@rating_searches.nil?
        render :rating
    end #if statement
  end #def

  def cuisine

  end

  def search_by
    @reviews = Review.all
  end
end

# def location
#   @reviews = Review.where(postalcode: params[:postal])
# end
#
# def cuisine
#   @reviews = Review.where(cuisine: params[:cuisine])
# end
# #
# def rating
#   @reviews = Review.where(rating: params[:rating])
# end
# #
# # def price
# # end
# #
#
# #def new_search
# # if there's a cuisine param, put it into an instance variable and send the user to the page that shows the results
# # if there's a postal/location param, put it into an instance variable and send the user to the page that shows the results
# # if there's a price param, put it into an instance variable and sent the user to the page that shows the results
# # if there's a rating param, put it into an instance variable and send the user to the page that shows the results
# # ELSE, show all the reviews on the index page
# #end
