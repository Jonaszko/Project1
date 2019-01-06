class ArticlesController < ApplicationController
  def new
    #I18n.locale = :pl
    @article = Article.new
    render #opcjonalnie jesli widok ma zgodna nazwe z akcją kontrolera
  end

  def create
    #binding.pry
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = t('articles.create.success')
      redirect_to article_path(@article.id) # "/articles/#{article.id}"
    else
      flash.now[:error] = t('articles.create.error', problems:@article.errors.full_messages.to_sentence)
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.new
    render
  end

  def index
    @list_articles = Article.all
    render
  end

  def edit
    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = t('articles.update.success')
      redirect_to article_path(@article.id)
    else
      flash.now[:error] = t('articles.update.error', problems: @article.errors.full_messages.to_sentence)
      render 'edit' #TODO poinformowac co sie nie udalo
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
