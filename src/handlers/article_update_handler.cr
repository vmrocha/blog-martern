class ArticleUpdateHandler < Marten::Handler
  @article : Article?
  @schema : ArticleSchema?

  def get
    render("article_update.html", context: {article: article, schema: schema})
  end

  def post
    if schema.valid?
      article.update!(schema.validated_data)
      redirect(reverse("home"))
    else
      render("article_update.html", context: {article: article, schema: schema})
    end
  end

  private def article
    @article ||= Article.get!(id: params["pk"])
  rescue Marten::DB::Errors::RecordNotFound
    raise Marten::HTTP::Errors::NotFound.new("Article not found")
  end

  private def initial_schema_data
    Marten::Schema::DataHash{"title" => article.title, "content" => article.content}
  end

  private def schema
    @schema ||= ArticleSchema.new(request.data, initial: initial_schema_data)
  end
end
