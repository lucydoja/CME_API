require 'nokogiri'
require 'httparty'
require 'byebug'

class Scraper
    def self.variables
        url= "https://www.boardvitals.com/cme-coach/"
        unparsed_page = HTTParty.get(url)
        parsed_page   = Nokogiri::HTML(unparsed_page)
        variables     = parsed_page.css('form.requirements-form').css('div')
        
        specialties = variables[0].css('option')
        states = variables[1].css('option')
        
        specialties_names = []
        specialties.each do  |specialty|
            specialty = specialty.attributes['value'].value
            specialties_names.append(specialty)
        end

        states_names = []
        states.each do  |state|
            state = state.attributes['value'].value
            states_names.append(state)
        end
        specialties_names.shift
        states_names.shift
        variables = {:specialties => specialties_names, 
                    :states => states_names
                }
        byebug
    end 

    def self.funcion(specialty, state)
        url= "https://www.boardvitals.com/cme-coach/#{specialty}/#{state}"
        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page)
        
        boards = parsed_page.css('ul.organizations-list')
        boards.each do |board|
            requirements = board.css('ul.at-a-glance').css('li').text.strip.split("\n")
            h = []
            # requirements.each do |requirement|
            #     val = requirement.text.strip
            #     h.append(val)
            # end
            name = board.css('div.org-header').text,
            #requirements = h
            information = {
            
            }
            
        end
        
        # name = board.css('h3').text
        # name = parsed_page.css('h1').text
        # boards = parsed_page.css('h3').children
        # a = []
        # boards.each do |board|
        #     title = board.text
        #     a.append(title)
        # end
        # a
        
    end

    variables()
    funcion('child-psychiatry', 'alabama')
    
    



end