require_relative "../config/environment"

DB = SQLite3::Database.new "students.db"
Student.create_table

student_urls = IndexScraper.new("http://students.flatironschool.com/")

student_urls.urls.each do |url|
	student_scrape = StudentScraper.new("http://students.flatironschool.com/#{url}")
	student_instance = student_scrape.scrape
	puts "scraping #{student_instance.name}"
end