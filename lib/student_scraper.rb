class StudentScraper
	def initialize(student_url)
		@student_doc = Nokogiri::HTML(open(student_url))
	end

		def scrape
		scrape_info
		create_student_instance
	end

	def scrape_info
		@student_name = @student_doc.css('h4.ib_main_header').text
		@bio = @student_doc.css('div#ok-text-column-2 div.services p:first-of-type').first.text.strip
		@photo = (@student_doc.css('div.top-page-title img').collect { |a| a.attr('src')}[0]).gsub('..', 'http://students.flatironschool.com')
		# @tagline
		# @github
		# @treehouse
		# @codeschool
		# @coderwall
		# @twitter
		# @linkedin
		# @education
		# @work
	end

	def create_student_instance
		@student = Student.new
		@student.name = @student_name
		@student.bio = @bio
		@student.photo = @photo
		@student.save
		@student
	end
end

