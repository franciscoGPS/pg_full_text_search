class Posts::EditPage < MainLayout
  needs operation : SavePost
  needs post : Post
  quick_def page_title, "Edit Post with id: #{post.id}"

  def content
    link "Back to all Posts", Posts::Index
    h1 "Edit Post with id: #{post.id}"
    render_post_form(operation)
  end

  def render_post_form(op)
    form_for Posts::Update.with(post.id) do
      # Edit fields in src/components/posts/form_fields.cr
      mount Posts::FormFields, op

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
