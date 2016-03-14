namespace :scrape do

  file_path = "#{Rails.root}/tmp/downloads/data.csv"

  desc "Download and import csv"
  task download_csv: :environment do
    require "open-uri"
    require "csv"

    remote_base_url = "http://data.saccounty.net/rest/datastreams/212850"
    remote_page_name = "data.csv"
    remote_full_url = remote_base_url + "/" + remote_page_name

    remote_data = open(remote_full_url).read

    local_file = open(file_path, 'w')

    local_file.write(remote_data)
    local_file.close

    CSV.foreach(file_path) do |row|
      Check.create(date: row[0], number: row[1], amount: row[2], name: row[3])
    end

  end

  desc "Destroy all check data"
  task destroy_all_checks: :environment do
    Check.destroy_all
  end

end
