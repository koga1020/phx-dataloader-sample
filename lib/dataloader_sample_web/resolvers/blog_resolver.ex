defmodule DataloaderSampleWeb.BlogResolver do
  alias DataloaderSample.Blog

  def list_posts(_, _, _) do
    {:ok, Blog.list_posts()}
  end
end
