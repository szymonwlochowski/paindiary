module ApplicationHelper
  def records_chart_data(description = nil, start = 3.weeks.ago)
    total_by_day = current_user.posts.total_grouped_by_day(start)
    description_sum_by_day = current_user.posts.sum_of_description_by_day(start)

    (start.to_date..Time.zone.today).map do |date|
      chart_hash = {
        date: date,
        total_amount: total_by_day[date].try(:first).try(:total_amount) || 0
      }
      Description.all.each_with_index do |description, index|
        chart_hash[description.name] = 0 #description_sum_by_day[index][date].try(:first).try(:total_amount) || 0
      end
      chart_hash
    end
  end
end
