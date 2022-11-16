class Posts::New < BrowserAction
  get "/posts/new" do
    html NewPage, operation: SavePost.new
  end
end
