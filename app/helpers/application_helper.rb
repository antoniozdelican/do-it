module ApplicationHelper

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success" # Green
      when :error
        "alert-danger" # Red
      when :alert
        "alert-warning" # Yellow
      when :notice
        "alert-info" # Blue
      else
        flash_type.to_s
    end
  end

  def nice_date(datetime)
    if datetime.is_a? String
      DateTime.parse(datetime).strftime("%d %b %Y")
    else
      datetime.strftime("%d %b %Y")
    end
  end

  def item_status_color(status)
    case status
    when "Pending"
      "active"
    when "Completed"
      "success"
    when "Canceled"
      "danger"
    else
      ""
    end
  end
end
