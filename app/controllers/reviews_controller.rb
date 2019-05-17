class ReviewsController < ApplicationController

  # def show
  #   @review = Review.find params[:id]
  # end

  # def new
  #   @review = Review.new
  # end

  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product), notice: 'Review added!'
    end

  end

  # def destroy
  # end

  private

  def review_params
    params.require(:review).permit(
      :rating, :description)
  end

end
