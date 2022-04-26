defmodule DataloaderSampleWeb.Schema do
  use Absinthe.Schema

  import Absinthe.Resolution.Helpers

  alias DataloaderSample.Blog
  alias DataloaderSampleWeb.BlogResolver

  object :post do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :body, non_null(:string)

    field :comments, non_null(list_of(:comment)) do
      resolve(dataloader(Blog))
    end
  end

  object :comment do
    field :id, non_null(:id)
    field :body, non_null(:string)
  end

  query do
    field :posts, non_null(list_of(non_null(:post))) do
      resolve(&BlogResolver.list_posts/3)
    end
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Blog, Blog.data())

    Map.put(ctx, :loader, loader)
  end

  def plugins() do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end
end
