defmodule DataloaderSampleWeb.Schema do
  use Absinthe.Schema

  alias DataloaderSampleWeb.BlogResolver

  object :post do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :body, non_null(:string)
  end

  query do
    field :posts, non_null(list_of(non_null(:post))) do
      resolve(&BlogResolver.list_posts/3)
    end
  end
end
