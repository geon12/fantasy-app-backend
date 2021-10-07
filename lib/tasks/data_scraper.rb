require 'kimurai'

class DataScraper < Kimurai::Base
    @name= 'nba_scraper'
    @start_urls = ["https://www.nba.com/stats/players/traditional/?sort=PTS&dir=-1"]
    @engine = :mechanize

    def parse(response, url:, data: {})
    end
end