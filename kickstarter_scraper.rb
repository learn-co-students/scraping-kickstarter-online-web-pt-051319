require 'nokogiri'
require 'pry'

def kickstarter

	html = File.read('fixtures/kickstarter.html')
	Nokogiri::HTML(html)

end

def create_project_hash

	projects = {}

	

	kickstarter.css(".project.grid_4").each do | project |
		
		title = project.css("h2.bbcard_name strong a").text
		image_link = project.css("div.project-thumbnail img").attribute("src").value
		description = project.css("p.bbcard_blurb").text.gsub("\n", "")	
		location = project.css("ul.project-meta span.location-name").text
		percent_funded = project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i

		projects[title.to_sym] = {
			:image_link => image_link,
			:description => description,
			:location => location,
			:percent_funded => percent_funded
		}

	end

	projects
end