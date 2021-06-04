class ArticlesController < ApplicationController
    before_action :find_article, except: [ :index, :new, :create, :from_author ]
    before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end
    def new
        @article = Article.new
    end

    def create
        @article = current_user.articles.create(article_params)
        redirect_to @article
    end

    def show
    end

    def edit
    end

    def update
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end

    def destroy
        @article.destroy
        redirect_to root_path
    end

    def from_author
        @user = User.find(params[:user_id])
    end

    def find_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :content)
    end
end
