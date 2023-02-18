class HomeHandler < Marten::Handlers::RecordList
  model Article
  template_name "home.html"
  list_context_name "articles"
end
