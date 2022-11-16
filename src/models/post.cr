class Post < BaseModel
  alias TSVector = String

  table do
    column author : String
    column title : String
    column description : String
    ## Columns for multisearch func
    #column desc_auth_w : Post::TSVector? 
  end
end


