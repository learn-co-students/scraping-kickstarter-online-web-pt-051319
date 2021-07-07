# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  #This just opens up a file and reds it into a local_variables
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  
  projects = {}
  #added project variable
  project = kickstarter.css("li.project.grid_4").first
  #binding.pry
  
  
  #iterate through the projects
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
       :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
       }
  end
  #return project hash
  projects
  end
create_project_hash


#projects: kickstarter.css("li.project.grid_4")project
#title project.css("h2.bbcard_name strong a").text
#image link: project.css("div.project-thumbnail a img").attribute("src").value
#project.css("p.bbcard_blurb").text
#project.css("ul.project-meta span.location-name").text
#project.css("ul.project-stats li.first.funded strong").text..gsub("%", "").to_i 
#.gsub("%", "").to_i  removes the percentage sign and converts the number to an integer for math usage 