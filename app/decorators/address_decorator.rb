class AddressDecorator < Draper::Decorator
  delegate_all

  def split_address
    address = []
    count = object.contact_address.split(',').count
    tmp_address = object.contact_address.split(',', count - 2)
    address << tmp_address[0..-2].join(',')
    address << tmp_address.last

    address
  end

  def first_name
    object.name.split(' ', 2)[0] if object.name.present?
  end

  def last_name
    object.name.split(' ', 2)[1] if object.name.present?
  end

  def detach_address
    address = {}
    if object.name.present?
      array_address = object.contact_address.split(',') 
      address[:province] = array_address[-1].strip
      address[:district] = array_address[-2].strip
      address[:village] = array_address[-3].strip
      address[:hamlet] = array_address[0..-4].join(',').strip
    end

    address
  end

end
