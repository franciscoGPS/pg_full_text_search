class Posts::FormFields < BaseComponent
  needs operation : SavePost

  def render
    mount Shared::Field, operation.title, &.text_input(autofocus: "true")
    mount Shared::Field, operation.author
    mount Shared::Field, operation.description
  end
end
