class ArticlesController < ApplicationController
    before_action :find_article, except: [ :index, :new, :create, :from_author ]
    before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy]

    def index
        @articles = Article.paginate(page: params[:page], per_page: 8)
    end
    def new
        @article = Article.new
        @categories = Category.all
    end

    def create
        @article = current_user.articles.create(article_params)
        @article.save_categories
        redirect_to @article
    end

    def show
    end

    def edit
        @categories = Category.all
    end

    def update
        @article.update(article_params)
        @article.save_categories
        redirect_to @article
    end

    def destroy
        @article.destroy
        redirect_to root_path
    end

    def from_author
        @user = User.find(params[:user_id])
    end

    def find_article
        @article = Article.friendly.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:content,:picture,:category_elements => [])
    end
end