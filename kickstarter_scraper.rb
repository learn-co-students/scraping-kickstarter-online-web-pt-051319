# require "pry"

def create_project_hash
  html = File.read ('fixtures/kickstarter.html')
  
  kickstarter = Nokogiri::HTML(html)
  end
open fixtures/kickstarter.html
end

binding.pry
end

create_project_hash

end