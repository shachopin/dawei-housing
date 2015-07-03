module ApplicationHelper
  def fix_url(str)
    str.start_with?("http") ? str : "http://#{str}"
  end

  def pet_situation(tenant)
    if tenant.has_pet
      "has pets"
    else
      "has no pet"
    end
  end

  def preserve_linebreak(text)
    text.gsub("\r\n", "<br />").html_safe
  end

  def display_time(dt)
    if logged_in? && !current_user.time_zone.blank?
      dt=dt.in_time_zone(current_user.time_zone)
    end
    dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end

end
