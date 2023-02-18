class ArticleDeleteHandler < Marten::Handler
  @article : Article?

  def get
    render("article_delete.html", context: {article: article})
  end

  def post
    article.delete
    redirect(reverse("home"))
  end

  private def article
    @article ||= Article.get!(id: params["pk"])
  rescue Marten::DB::Errors::RecordNotFound
    raise Marten::HTTP::Errors::NotFound.new("Article not found")
  end
end
