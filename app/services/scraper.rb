require 'nokogiri'
require 'httparty'
require 'byebug'

class Scraper
    attr_accessor :url

    def initialize()
        @url = "https://www.boardvitals.com/cme-coach/"
    end
    
    def parse(url)
        unparsed_page = HTTParty.get(url)
        parsed_page   = Nokogiri::HTML(unparsed_page)
        
    end

    def specialties
        parsed_page = parse(url)
        variables     = parsed_page.css('form.requirements-form').css('div')
        specialties   = variables[0].css('option')
        
        specialties_names = []
        specialties.each do  |specialty|
            specialty = specialty.attributes['value'].value
            specialties_names.append(specialty)
        end

        specialties_names.shift
        specialties_names
        
    end

    def states
        parsed_page = parse(url)
        variables     = parsed_page.css('form.requirements-form').css('div')
        states = variables[1].css('option')
        
        states_names = []
        states.each do  |state|
            state = state.attributes['value'].value
            states_names.append(state)
        end
        
        states_names.shift
        states_names
        
    end 

    def cme(specialty, state)
        url= "https://www.boardvitals.com/cme-coach/#{specialty}/#{state}"
        
        parsed_page = parse(url)
        boards      = parsed_page.css('ul.organizations-list')
        information = []

        boards.each do |board|
            requirements = board.css('ul.at-a-glance').css('li').text.strip.split("\n")
            requirement_list = []
            requirements.each do |requirement|
                requirement = requirement.strip
                if requirement != ""
                    requirement_list.append(requirement)
                end
            end

            requirement_list     = requirement_list
            org_name             = board.css('div.org-header').css('h3').text
            org_url              = board.css('div.org-header').css('a')[0].attributes['href'].value
            
            board_info = {
                :board_name   => org_name,
                :board_url    => org_url,
                :requirements => requirement_list,
            }
            information = information.append(board_info)
        end
        information
    end
end