# Build an SQL database that keeps track of books 
# We have tables for Characters, Books, Series, Authors and Sub-Genres

# selects all of the books titles and years in the first series and orders them chronologically
def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year 
  FROM books 
  WHERE series_id=1
  ORDER BY year"
end

# returns the name and motto of the character with the longest motto (FAILED - 2)
def select_name_and_motto_of_char_with_longest_motto
   <<-SQL
    SELECT name, motto 
    FROM characters 
    ORDER BY LENGTH(motto) DESC 
    LIMIT 1
  SQL
end

# determines the most prolific species of characters and return its value and count (FAILED - 3)
def select_value_and_count_of_most_prolific_species
   "SELECT species, COUNT(*)
 FROM characters 
 GROUP BY species 
 ORDER BY COUNT(species) DESC
 LIMIT 1"
end

# selects the authors names and their series' subgenres
def select_name_and_series_subgenres_of_authors
   <<-SQL 
   SELECT authors.name, subgenres.name 
   FROM authors 
   JOIN series 
   ON series.author_id = authors.id 
   JOIN subgenres 
   ON series.subgenre_id = subgenres.id
 SQL
end

# selects the series title with the most characters that are the species "human" 
def select_series_title_with_most_human_characters
   "SELECT series.title
   FROM series
   JOIN books
   ON books.series_id = series.id
   JOIN character_books
   ON character_books.book_id = books.id
   JOIN characters
   ON character_books.character_id = characters.id
   WHERE characters.species = 'human'
   GROUP BY series.title
   ORDER BY COUNT(*) DESC
   LIMIT 1"
end

# selects all of the character names and the number of books they have appeared in, grouped by character name, 
# in descending order by number of books and ascending order by character name
def select_character_names_and_number_of_books_they_are_in
  <<-SQL
    SELECT characters.name, COUNT(*) as book_count 
    FROM character_books 
    JOIN characters 
    ON character_books.character_id = characters.id 
    GROUP BY characters.name 
    ORDER BY book_count DESC, characters.name
  SQL
end
