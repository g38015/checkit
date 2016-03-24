class Check < ActiveRecord::Base
  require 'csv'

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query
    ]
  )

  scope :search_query, lambda { |query|
  # Searches the students table on the 'first_name' and 'last_name' columns.
  # Matches using LIKE, automatically appends '%' to each term.
  # LIKE is case INsensitive with MySQL, however it is case
  # sensitive with PostGreSQL. To make it work in both worlds,
  # we downcase everything.
  return nil  if query.blank?

  # condition query, parse into individual keywords
  terms = query.downcase.split(/\s+/)

  # replace "*" with "%" for wildcard searches,
  # append '%', remove duplicate '%'s
  terms = terms.map { |e|
    # "%#{e.gsub('*', '')}%"
    (e.gsub('', '%') + '%').gsub(/%+/, '%')
  }
  # configure number of OR conditions for provision
  # of interpolation arguments. Adjust this if you
  # change the number of OR conditions.
  num_or_conds = 1

  clause = terms.map { |term|
      "(LOWER(checks.name) LIKE ?)"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten

  #byebug

  where(clause)
}
  scope :sorted_by, lambda { |sort_key|
    # Sorts students by sort_key

  }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      check_hash = row.to_hash # exclude the price field
      puts check_hash
      check = Check.where(id: check_hash["id"])

      if check.count == 1
        check.first.update_attributes(check_hash)
      else
        Check.create!(check_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)
end
