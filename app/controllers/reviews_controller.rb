class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]


  def edit
  end

# POST /places
  # POST /places.json
  def create
    @review = current_user.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to place_path(@review.place), notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to place_path(@review.place), notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to place_path(@review,place), notice: 'Review was successfully destroyed.' }
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :place_id)
  end
end