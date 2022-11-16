class Posts::Index < BrowserAction

  get "/posts" do
    query = params.get?("search_operation:search_query") || ""
    post_query = PostQuery.new
    pp " START query without scope"
    pp post_query.desc_auth_w(query).to_sql
    pp " END query without scope"
    pp " START query with scope before fts_scope "
    pp post_query.titles.desc_auth_w(query).to_sql
    pp " END query with scope before fts_scope "
    pp " START query with scope before fts_scope "
    pp post_query.desc_auth_w(query).titles.to_sql
    pp " END query with scope before fts_scope "
    html IndexPage, 
    posts: PostQuery.new, 
    search_op: SearchOperation.new(search_query: query), 
    desc_auth_results: PostQuery.new.desc_auth_w(query)
  end
end
