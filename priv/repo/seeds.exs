alias DataloaderSample.Blog.Comment
alias DataloaderSample.Blog.Post

Enum.each(1..5, fn _ ->
  post =
    %Post{title: Faker.Lorem.sentence(), body: Faker.Lorem.paragraph()}
    |> DataloaderSample.Repo.insert!()

  Enum.each(1..5, fn _ ->
    %Comment{body: Faker.Lorem.paragraph(), post_id: post.id} |> DataloaderSample.Repo.insert()
  end)
end)
