class ScrapeController < ApplicationController
    
    def create
        data = DataScraper.process(scrape_params[:name],scrape_params[:date])
        date = scrape_params[:date]
        if data
            if data.empty? || data.keys.length < 23
                render json: {message: "Not Active on #{date[5..6]}/#{date[8..9]}/#{date[0..3]}"}
            else
                render json: data
            end
        else
            render json: {message: "No Statistics Available"}
        end
    end
    private
    def scrape_params
        params.require(:scrape).permit(:name, :date)
    end
end
