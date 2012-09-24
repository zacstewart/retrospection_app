module RetrospectionsHelper
  def previous_day(retrospection)
    retrospection_path(retrospection.retrospected_on - 1.day)
  end

  def next_day(retrospection)
    retrospection_path(retrospection.retrospected_on + 1.day)
  end
  
  def today_retrospection_path
    retrospection_path(Date.today.to_s)
  end
end
