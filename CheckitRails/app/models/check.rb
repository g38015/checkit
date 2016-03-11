class Check < ActiveRecord::Base
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      check_hash = row.to_hash # exclude the price field
      check = Check.where(id: check_hash["id"])

      if check.count == 1
        check.first.update_attributes(check_hash)
      else
        Check.create!(check_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)
end