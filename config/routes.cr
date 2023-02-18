# The main routes map associates routes to handlers.
# For more information please see: https://martenframework.com/docs/handlers-and-http/routing
Marten.routes.draw do
  path "/", HomeHandler, name: "home"
  path "/article/create", ArticleCreateHandler, name: "article_create"
  path "/article/<pk:int>", ArticleDetailHandler, name: "article_detail"
  path "/article/<pk:int>/update", ArticleUpdateHandler, name: "article_update"
  path "/article/<pk:int>/delete", ArticleDeleteHandler, name: "article_delete"

  if Marten.env.development?
    path "#{Marten.settings.assets.url}<path:path>", Marten::Handlers::Defaults::Development::ServeAsset, name: "asset"
    path "#{Marten.settings.media_files.url}<path:path>", Marten::Handlers::Defaults::Development::ServeMediaFile, name: "media_file"
  end
end
