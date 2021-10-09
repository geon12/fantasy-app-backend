require 'kimurai'

class DataScraper < Kimurai::Base
    @name= 'nba_scraper'
    @start_urls = ["https://www.basketball-reference.com/leagues/NBA_2021_per_game.html"]
    @engine = :mechanize

    def parse(response, url:, data: {})
     table = response.xpath("//div[@id='per_game_stats']/div/a")
    end

    def parse_box_score(response, url:, data: {})

    end
end