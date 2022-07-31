class CategoryDecorator < Draper::Decorator
  delegate_all

  def to_name_file
    result = object.name.downcase.strip
    result = result.gsub("đ", "d")
    result = result.gsub(/[ýỳỵỷỹ]/, "y")
    result = result.gsub(/[úùụủũưứừựửữ]/, "u")
    result = result.gsub(/[éèẹẻẽêếềểệễ]/, "e")
    result = result.gsub(/[óòọỏõôốồộổỗơớờợởỡ]/, "o")
    result = result.gsub(/[áàạảãâấầậẩẫăắằặẳẵ]/, "a")
    result = result.gsub(/[íìịỉĩ]/, "i")
    result = result.gsub('-', '')
    result = result.gsub(',', '')
    result = result.split(' ').join('_')

    result
  end

end
