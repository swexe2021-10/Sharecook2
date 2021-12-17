class ReviewsController < ApplicationController
    def new
        @review = Review.new(cook_id: params[:cook_id])
    end 
    def create 
        comment = params[:review][:comment]
        cook_id = params[:review][:cook_id]
        user_id = current_user.id
        @review = Review.new(comment: comment, cook_id: cook_id, user_id: user_id)
        if @review.save
            flash[:info] = 'コメントを投稿しました'
            redirect_to cooks_path
        else
            render 'new'
        end 
    end
    def destroy 
        review = Review.find(params[:id])
        review.destroy
        redirect_to cooks_path
    end 
end