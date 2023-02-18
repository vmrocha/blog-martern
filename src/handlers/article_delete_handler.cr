class ArticleDeleteHandler < Marten::Handlers::RecordDelete
  model Article
  template_name "article_delete.html"
  success_route_name "home"
  record_context_name "article"
end
