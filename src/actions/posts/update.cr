class Posts::Update < BrowserAction
  put "/posts/:post_id" do
    post = PostQuery.find(post_id)
    SavePost.update(post, params) do |operation, updated_post|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(updated_post.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, post: updated_post
      end
    end
  end
end
