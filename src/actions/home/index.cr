class Home::Index < BrowserAction
  get "/" do
    redirect to: Posts::Index
  end
end
