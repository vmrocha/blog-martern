class ArticleDetailHandler < Marten::Handlers::RecordDetail
  model Article
  template_name "article_detail.html"
  record_context_name "article"
end
