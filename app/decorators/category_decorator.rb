class CategoryDecorator < Draper::Decorator
  delegate_all

  def to_name_file
    result = object.name.downcase.strip
    result = result.gsub(/[úùụủũưứừựửữ]/, "u")
    result = result.gsub(/[éèẹẻẽêếềểệễ]/, "e")
    result = result.gsub(/[óòọỏõôốồộổỗơớờợởỡ]/, "o")
    result = result.gsub(/[áàạảãâấầậẩẫăắằặẳẵ]/, "a")
    reuslt = result.gsub(/[íìịỉĩ]/, "i")
    result = result.gsub(' ', '_')

    result
  end

end
