class ArticleUpdateHandler < Marten::Handlers::RecordUpdate
  model Article
  schema ArticleSchema
  template_name "article_update.html"
  success_route_name "home"
  record_context_name "article"
end
