class IndexScraper
	
	def initialize(index_url)
		@index_doc = Nokogiri::HTML(open(index_url))
	end

	def urls
		@urls = @index_doc.css('div.big-comment h3 a').collect {|l| l.attr('href')}
	end
end