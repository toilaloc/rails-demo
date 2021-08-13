class Admin::PostsController < ApplicationController
    
    def index
        @posts = Post.order(id: :desc)
    end

    def new
        @post = Post.new
        @categories = Category.select("id,name")
    end

    def create
        # set default user's post = 1 if not login
        # unless is current user
        @post = Post.new post_params
        @categories = Category.select("id,name")

        if @post.save
            flash[:message] = "Post created!"
            redirect_to admin_posts_path
        else
            flash[:message] = "Create failed!!!"
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        @categories = Category.select("id, name")
    end

    def update
        @post = Post.find(params[:id])
        @categories = Category.select("id, name")
        if @post.update_attributes(post_params)
            flash[:message] = "Updated!"
            redirect_to admin_posts_path
        else
            flash[:message] = "Update Failed!!!"
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if @post.delete
            flash[:message] = "Deleted"
            redirect_to admin_posts_path
        else
            flash[:message] = "Deleted Failed"
            render :destroy
        end
    end

    private
    def post_params
        defaults = { user_id: session[:user_id] }
        params.require(:post).permit(:title, :content, :tag, :user_id, :category_id).reverse_merge(defaults)
    end
end
