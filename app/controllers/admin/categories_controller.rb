class Admin::CategoriesController < ApplicationController
    def index
      @categories = Category.order(id: :desc)
    end

    def new
        @category = Category.new
        @categories_parent = Category.select("id, name")
    end

    def create
      @category = Category.new category_params
      @categories_parent = Category.select("id, name")
      if @category.save
        flash[:message] = "Created category success"
        redirect_to admin_categories_path
      else
        flash[:message] = "Created failed"
        render :new
      end
    end

    def edit
        @category = Category.find(params[:id])
        @categories_parent = Category.select("id, name")
    end

    def update
        @category = Category.find(params[:id])
        if @category.update_attributes(category_params)   
            flash[:message] = 'Category updated!'   
            redirect_to admin_categories_path   
        else   
            flash[:message] = 'Failed to edit category!'   
            render :edit   
        end   
    end

    def show
    end

    def destroy
        @category = Category.find(params[:id])
        if @category.delete
            flash[:message] = 'Category deleted!'   
            redirect_to admin_categories_path   
        else
            flash[:message] = 'Delete failed!' 
            render :destroy
        end
    end

    private
    def category_params
        params.require(:category).permit(:name, :description, :parent_id)
    end
end
