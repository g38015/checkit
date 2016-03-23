namespace :scrape do

  file_path = "#{Rails.root}/tmp/downloads/data.csv"

  desc "Download and import csv"
  task download_csv: :environment do
    require "open-uri"
    require "csv"
    require "nokogiri"

    url = "http://data.saccounty.net/dataviews/226166/outstanding-checks-from-county-of-sacramento/"
    # url = ENV.fetch('DATA_CSV_URL')
    page = Nokogiri::HTML(open(url))

    page.css("a#id_exportToCSVButton").each do |line|
      page_url = "http://data.saccounty.net/#{line['href']}"
      
      remote_data = open(page_url).read

      local_file = open(file_path, 'w')

      local_file.write(remote_data)
      local_file.close

      CSV.foreach(file_path) do |row|
        Check.create(date: row[0], number: row[1], amount: row[2], name: row[3])
      end
    end
  end

  desc "Destroy all check data"
  task destroy_all_checks: :environment do
    Check.destroy_all
  end

end
