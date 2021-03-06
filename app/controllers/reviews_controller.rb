class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
    # assign review to current_user
    if user_signed_in?
    @user = User.find(current_user.id)
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    
  end

  # GET /reviews/new
  def new
    @review = Review.new
    # @review = Review.find(params[:id])
  end

  # GET /reviews/1/edit
  def edit
  end
  # method 'maplocation' will render map on page
  def map_location
    @review = Review.find(params[:id])
    @hash = Gmaps4rails.build_markers(@review) do |review, marker|
      marker.lat(review.latitude)
      marker.lng(review.longitude)
      marker.infowindow("<em>" + review.street + "</em>")
    end
    render json: @hash.to_json
  end


  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:latitude, :longitude, :restaurant_name, :cuisine, :dish, :price, :rating, :street, :city, :state, :postalcode, :description, :user_id, :image)
  end
end
