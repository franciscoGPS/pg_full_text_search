class Posts::Create < BrowserAction
  post "/posts" do
    SavePost.create(params) do |operation, post|
      if post
        flash.success = "The record has been saved"
        redirect Posts::Index
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
