require "sinatra"
require "json"
set :bind, "0.0.0.0"

def show_books()
    file = File.read("pages/books.json")
    data = JSON.parse(file)
    return data
rescue Errno::ENOENT
    return nil
end

def save_content(file, content)
    File.open("pages/books.json", "w") do |file|
        file.write(content.to_json)
    end
end

# Homepage
get("/") do
    @output = show_books()
    erb :welcome
end

# Add Book page
get("/add_book") do
    erb :add_book
end

# Add book form submission
post("/save_book") do
    string = File.read("pages/books.json")
    books = JSON.parse(string)
    book = {
        "title" => params[:name],
        "author" => params[:author],
        "description" => params[:content]
    }
    books.push(book)

    save_content("books", books)
    redirect ("/")
end
