class ArticleDetailHandler < Marten::Handler
  def get
    render("article_detail.html", context: {article: Article.get!(id: params["pk"])})
  rescue Marten::DB::Errors::RecordNotFound
    raise Marten::HTTP::Errors::NotFound.new("Article not found")
  end
end
