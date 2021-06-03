class ArticlesController < ApplicationController
    before_action :find_article, except: [ :index, :new, :create ]
    before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end
    def new
        @article = Article.new
    end

    def create
        @article = Article.create(title: params[:article][:title], content: params[:article][:content])
        render json: @article
    end

    def show
    end

    def edit
    end

    def update
        if @article.update(title: params[:article][:title], content: params[:article][:content])
            redirect_to @article
        else
            render :edit
        end
    end

    def destroy
        @article.destroy
        redirect_to root_path
    end

    def find_article
        @article = Article.find(params[:id])
    end
end