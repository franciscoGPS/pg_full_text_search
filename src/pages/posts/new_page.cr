class Posts::NewPage < MainLayout
  needs operation : SavePost
  quick_def page_title, "New Post"

  def content
    h1 "New Post"
    render_post_form(operation)
  end

  def render_post_form(op)
    form_for Posts::Create do
      # Edit fields in src/components/posts/form_fields.cr
      mount Posts::FormFields, op

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
