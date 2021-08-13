class Client::CategoriesController < ApplicationController
    skip_before_action :require_login, only: [:show]
    skip_before_action :admin_guard, only: [:show]

    def show
        @post = Post.where category_id: params[:id]
        @category = Category.find_by id: params[:id]
    end
end
