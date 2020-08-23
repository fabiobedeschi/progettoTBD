module AuthorsHelper
  def string_dob_dod(author)
    if author.dob.nil?
      author.dod.nil? ? '' : "? - #{string_date author.dod}"
    else
      author.dod.nil? ? (string_date author.dob) : "#{string_date author.dob} - #{string_date author.dod}"
    end
  end
end
