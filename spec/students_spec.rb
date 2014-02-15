require_relative 'spec_helper'

describe "Student" do
	before(:each) do
		DB.execute("CREATE TABLE students (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, bio TEXT, photo TEXT)")
	end
	after(:each) do
		DB.execute("DROP TABLE students")
	end

	it 'has a name' do
		dannyscrape = StudentScraper.new('http://students.flatironschool.com/students/dfenjves.html')
		danny_instance = dannyscrape.scrape
		
		expect(danny_instance.name).to eq("Daniel Fenjves")
	end

	it 'has a bio' do
		dannyscrape = StudentScraper.new('http://students.flatironschool.com/students/dfenjves.html')
		danny_instance = dannyscrape.scrape
		
		expect(danny_instance.bio).to eq("The 'J' in my name is silent. I enjoy improv, table tennis, scuba diving and scrabble. On several occasions, I have raised urban chickens.")
	end

	it 'has a photo' do
		dannyscrape = StudentScraper.new('http://students.flatironschool.com/students/dfenjves.html')
		danny_instance = dannyscrape.scrape
		
		expect(danny_instance.photo).to eq("http://students.flatironschool.com/img/students/dfenjves.jpg")
	end	

end