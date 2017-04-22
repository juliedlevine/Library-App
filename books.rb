require "sinatra"
require "json"
require 'pg'
set :bind, "0.0.0.0"

def book_data()
    conn = PG.connect( dbname: 'library' )
    conn.exec( "SELECT * FROM books" ) do |result|
        books_array = []
        result.each do |row|
            books_array.push(row)
        end
        return books_array
    end
end

# Homepage
get("/") do
    @output = book_data()
    erb :welcome
end

# Add Book page
get("/add_book") do
    erb :add_book
end

# Update book page
post("/update/:title/:author/:description") do
    @title = params[:title]
    @author = params[:author]
    @description = params[:description]
    erb :update
end


# Add book form submission
post("/save_book") do
    @title = params[:title]
    @author = params[:author]
    @description = params[:description]
    conn = PG.connect( dbname: 'library' )
    conn.exec( "insert into books values (default, $1, $2, $3)", [@title, @author, @description] )
    redirect ("/")
end

# Update book form submission
post("/update_book/:title") do
    title = params[:title]
    new_title = params[:new_title]
    new_author = params[:new_author]
    new_content = params[:new_content]
    conn = PG.connect( dbname: 'library' )
    conn.exec( "Update books set title = $1, author = $2, description = $3 where title = $4", [new_title, new_author, new_content, title] )
    redirect ("/")
end

# Delete book form submission
post("/delete/:title") do
    title = params[:title]
    conn = PG.connect( dbname: 'library' )
    conn.exec( "Delete from books where title = $1", [title] )
    redirect ("/")
end
