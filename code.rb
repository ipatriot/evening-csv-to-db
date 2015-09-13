#YOUR CODE GOES HERE
require "csv"
require "pg"

def db_connection
  begin
    connection = PG.connect(dbname: "ingredients")
    yield(connection)
  ensure
    connection.close
  end
end


  # Retrieve the name of each task from the database
ingredient_list = db_connection do |conn|
  conn.exec("SELECT name FROM ingredients")
end

ingredient_list.to_a.each do |ing|
  puts ing["name"]
end
