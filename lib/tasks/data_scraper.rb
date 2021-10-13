require 'kimurai'
# require 'date'
class DataScraper < Kimurai::Base

    attr_accessor :player_name
    #2018-07-22"
    #
    # Date::MONTHNAMES[parseInt(month)].toLowerCase()

    @name= 'nba_scraper'
    # "https://www.basketball-reference.com/leagues/NBA_2021_per_game.html"
    #@start_urls = ["https://www.basketball-reference.com/leagues/NBA_2021_games.html"]
    @engine = :mechanize
    

    def self.process(player_name,date)
        @@player_name = player_name
        @@date = date
        initial = player_name.split(' ')[1][0].downcase
        url = "https://www.basketball-reference.com/players/" + initial
        @start_urls = [url]
        self.parse!(:parse, url: url)#self.crawl!
    end
    
    def parse(response, url:, data: {})
        # months = response.xpath("//div[@class='filter']/div/a")
        # box = response.xpath("//td[@class='center ']/a")
        # months = months.map do |a|
        #     a[:href]
        # end
        
        
        players =  response.xpath("//th[@class='left ']/a | //th[@class='left ']/strong/a")
        player_link = ""
        players.find do |player|
            
            if (player.text.downcase === @@player_name.downcase)
                player_link = player[:href]
            end
            
        end

        
        if (player_link != "")

            year,month,day = @@date.split("-")
            if (month.to_i > 9) 
                year = year.to_i + 1
                year = year.to_s
            end
            
            player_link = player_link.split(".")[0] + "/gamelog/#{year}"
            request_to(:parse_player, url: "https://www.basketball-reference.com" + player_link, data: {})
        end
        
    end

    def parse_player(response, url:, data: {})
        # date =  response.xpath("//a[text()='#{@@date}']/../../td[@class='right '] | td[@class='right iz']")
        date =  response.xpath("//a[text()='#{@@date}']/../../td[@class='right '] | //a[text()='#{@@date}']/../../td[@class='right iz']")
        player_data = {}
        stats = [:age,:gs,:mp,:fg,:fga,:fg_pct,:fg3,:fg3a,:fg3_pct,:ft,:fta,:ft_pct,:orb,:drb,
        :trb,:ast,:stl, :blk, :tov,:pf,:pts,:game_score,:plus_minus]
        
        date.each_with_index do |st,i|
            
            player_data[stats[i]] = st.text
        end
        player_data
    end

    

    
end

#x= DataScraper.process("LeBron James","2020-12-25")


