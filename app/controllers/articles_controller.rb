class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: "Article was created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if set_article.update(article_params)
      redirect_to article_path(set_article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.required(:article).permit(:name, :description)
  end
end
