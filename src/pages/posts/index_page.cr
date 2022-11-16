class Posts::IndexPage < MainLayout
  needs posts : PostQuery
  quick_def page_title, "All Posts"
  needs search_op : SearchOperation
  needs desc_auth_results : PostQuery

  def content
    h1 "All Posts"
    link "New Post", to: Posts::New
    search_bar

    search_post_results_section("description author results ", desc_auth_results)
    render_posts
  end

  def search_bar
    form(method: "get", class: "custom-form", action: Posts::Index.path, id: "search_form") do
      search_input(search_op.search_query, class: "custom-input mt-1", placeholder: "Search something")
    end
  end
  
  def search_post_results_section(title, results)
    h2 title
    div class: "" do 
      unless results.nil? 
        results.not_nil!.each do | result | 
          span "#{result.title} - #{result.author} - #{result.description}"
          br
        end
      end
    end
  end

  def search_results_section
    div class: "" do 
      unless search_results.nil? 
        search_results.not_nil!.each do | result | 
          span result.content
        end
      end
    end
  end

  def render_posts
    ul do
      posts.each do |post|
        li do
          span "-> #{post.title} - #{post.author} - #{post.description}" if post.title.present?
        end
      end
    end
  end
end
