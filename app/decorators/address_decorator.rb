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

end
