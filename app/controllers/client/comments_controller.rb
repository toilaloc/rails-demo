class Client::CommentsController < ApplicationController
    skip_before_action :admin_guard, only: [:create, :destroy]

    def create
        @comment = Comment.new comment_params
        if @comment.save
            flash[:message] = "Commented!"
            redirect_back(fallback_location: root_path)
        else
            flash[:message] = "Commented!"
            redirect_to :back
        end
    end

    def destroy
        @comment = Comment.find_by id: params[:id]

          if session[:user_id] == @comment.user_id
            if @comment.delete
              flash[:message] = "Deleted!"
              redirect_back(fallback_location: root_path)
            else 
              flash[:message] = "Failed!"
              redirect_back(fallback_location: root_path)
            end
          else
            flash[:message] = "Failed!"
            redirect_back(fallback_location: root_path)
          end

    end

    private
    def comment_params
        defaults = { user_id: session[:user_id] }
        params.require(:comment).permit(:content, :user_id, :post_id).reverse_merge(defaults)
    end

end
