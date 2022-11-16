class PostQuery < Post::BaseQuery 
  include LuckyFullTextSearch(Post)
  full_text_search("desc_auth_w", true, ["title", "description"])

  def titles
    description.like("%title%")
  end
end
