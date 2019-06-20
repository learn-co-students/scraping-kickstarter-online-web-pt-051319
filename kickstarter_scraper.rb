# require libraries/modules here
require 'nokogiri'
require 'open-uri'
require 'pry'

# Use the .attribute method on Nokogiri element ot grab the value of that attribute



def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  
  projects = {}
  
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    
     # converting the title to a symbol; making better hash keys than strings
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img"). attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }                          
  end
 projects
end



# selector == kickstarter.css("li.project.grid_4").first
# title == project.css("h2.bbcard_name strong a").text        ("Moby Dick: an Oratorio")
# Image Link == project.css("div.project-thumbnail a img").attribute("src").value
# description ==  project.css("p.bbcard_blurb").text
# lcoation == project.css("span.location-name").text
# percent_funded == project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
## .gsub("%","").to_i is to remove the percent sign and covnert it into an integer
