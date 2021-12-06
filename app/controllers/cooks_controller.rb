class CooksController < ApplicationController
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
        @cook = Cook.new(title: title, post: pos , file: file )
        if @cook.save
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
        Cook.update(title: title, post: pos , file: file )
         redirect_to controller: :cooks, action: :index
    end 
    def destroy
        cook = Cook.find(params[:id])
        cook.destroy
        redirect_to controller: :cooks, action: :index
    end 
end 
