require 'pg'

# Output a table of current connections to the DB
conn = PG.connect( dbname: 'music_db' )
conn.exec( "SELECT * FROM album" ) do |result|
  # puts "     PID | User             | Query"
  # result.each do |row|
  #   puts " %7d | %-16s | %s " %
  #     row.values_at('procpid', 'usename', 'current_query')
  # end
  result.each do |row|
    puts row
  end
end
