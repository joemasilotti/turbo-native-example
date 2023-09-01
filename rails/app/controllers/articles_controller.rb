class ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to article_url(@article), notice: "Your article was added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_url(@article), notice: "Your article was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_url, notice: "Your article was deleted."
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
