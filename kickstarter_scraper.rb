  require 'nokogiri'
  require 'pry'
  require 'awesome_print'

    def create_project_hash
      html = File.read('fixtures/kickstarter.html')
      kickstarter = Nokogiri::HTML(html)

      # projects: kickstarter.css("li.project.grid_4")
      # title project.css("h2.bbcard_name strong a").text
    end

    binding.pry

  create_project_hash
