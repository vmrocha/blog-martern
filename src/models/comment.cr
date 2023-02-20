class Comment < Marten::Model
  field :id, :big_int, primary_key: true, auto: true
  field :message, :string, max_size: 255
  field :article, :many_to_one, to: Article, related: :comments
end
