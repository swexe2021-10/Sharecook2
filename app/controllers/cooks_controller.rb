class CooksController < ApplicationController
    before_action :set_q, only: [:index, :search]
    impressionist :actions=> [:show]
    
    def index
        @cooks = Cook.all
    end
    
    def new 
        @cook = Cook.new
    end
    def create 
        title = params[:cook][:title]
        pos = params[:cook][:post]
        file = params[:cook][:file].read
        phrase = params[:cook][:phrase]
        material = params[:cook][:material]
        quantity = params[:cook][:quantity]
        arrange = params[:cook][:arrange]
        user_id = current_user.id
        @cook = Cook.new(title: title, post: pos , file: file , phrase: phrase ,
        material: material , quantity: quantity , arrange: arrange , user_id: user_id )
        if @cook.save
            flash[:info] = "料理を投稿しました"
            redirect_to controller: :cooks , action: :index
        else 
            render 'new'
        end 
    end 
    def get_image
        image = Cook.find(params[:id])
        send_data image.file, disposition: :inline, type: 'image/png'
    end
    def edit
        @cook = Cook.find(params[:id])
    end 
    def update
        cook = Cook.find(params[:id])
        title = params[:cook][:title]
        pos = params[:cook][:post]
        file = params[:cook][:file].read
        phrase = params[:cook][:phrase]
        material = params[:cook][:material]
        quantity = params[:cook][:quantity]
        arrange = params[:cook][:arrange]
        Cook.update(title: title, post: pos , file: file , phrase: phrase ,
        material: material , quantity: quantity , arrange: arrange )
         redirect_to controller: :cooks, action: :index
    end 
    def show
        @reviews = current_user.reviews
        #review.where(user_id: current_user.id )
        @cook = Cook.find(params[:id])
        impressionist(@cook, nil, unique: [:ip_address])
    end
    def destroy
        cook = Cook.find(params[:id])
        cook.destroy
        redirect_to controller: :cooks, action: :index
    end 
    
    def search
        @results = @q.result
    end 
    
    private
    
    def set_q
        @q = Cook.ransack(params[:q])
    end
end 
