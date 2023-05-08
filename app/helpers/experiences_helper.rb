module ExperiencesHelper
  def format_date_range(start_date, end_date)
    "#{start_date.strftime('%B %Y')}-#{end_date&.strftime('%B %Y') || 'present'}"
  end
end
