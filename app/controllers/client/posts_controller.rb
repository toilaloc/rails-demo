class Client::PostsController < ApplicationController
    
    skip_before_action :require_login, only: [:show]
    skip_before_action :admin_guard, only: [:show]

    def show
        @post = Post.find_by id: params[:id]
    end
end
