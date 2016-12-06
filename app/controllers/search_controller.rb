class SearchController < ApplicationController
  # search by one criteria at a time
  def new_search 

    if !params[:cuisine].nil? && !params[:cuisine].strip.empty?
     # search by cuisine only
     @search_results = Review.search(cuisine: params[:cuisine])
    else
     @search_results = Review.all
    end

    if !params[:postal].nil? && !params[:postal].strip.empty?
      # search by location only
      @search_results = @search_results.search(postalcode: params[:postal])
    end

    #search by rating
    if !params[:rating].nil? && !params[:rating].strip.empty?
      @search_results = @search_results.where(rating: params[:rating])
    end

    # search by price
    if !params[:price].nil? && !params[:price].strip.empty?
      if params[:price] == '10'
        @search_results = @search_results.where(price: 0..params[:price].to_i)
      elsif params[:price] == '20'
        @search_results = @search_results.where(price: 10..params[:price].to_i)
      elsif params[:price] == '30'
        @search_results = @search_results.where(price: 20..params[:price].to_i)
      elsif params[:price] == '41 +'
        @search_results = @search_results.where(price: 30..100000)
      end # if params == 10
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
