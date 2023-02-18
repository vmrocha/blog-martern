class HomeHandler < Marten::Handler
  def get
    render("home.html", context: {articles: Article.all})
  end
end
