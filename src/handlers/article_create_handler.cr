class ArticleCreateHandler < Marten::Handlers::RecordCreate
  model Article
  schema ArticleSchema
  template_name "article_create.html"
  success_route_name "home"
end
