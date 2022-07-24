namespace :import_db do
  desc "This is import data to table provinces"
  task province: :environment do
    unless Province.count == 63
      File.open('./dump/provinces.txt', 'r').map do |line|
        id, name, type, slug = line.strip.split("\t")
        id = id.gsub("(","").gsub(",","").gsub("'","").to_i
        name = name.gsub(",","").gsub("'","")
        type = type.gsub(",","").gsub("'","")
        slug = slug.gsub(",","").gsub("'","").gsub(")","").gsub(";","")
        province = Province.new(id: id, name: name, province_type: type, slug: slug)
        province.save!
      end
    else
      puts "Province exists!"
    end
  end

  desc "This is import data to table districts"
  task district: :environment do
    unless District.count == 705
      File.open('./dump/districts.txt', 'r').map do |line|
        id, name, type, province_id = line.strip.split("\t")
        id = id.gsub("(","").gsub(",","").gsub("'","").to_i
        name = name.gsub(",","").gsub("'","")
        type = type.gsub(",","").gsub("'","")
        province_id = province_id.gsub(",","").gsub("'","").gsub(")","").gsub(";","").to_i
        district = District.new(id: id, name: name, district_type: type, province_id: province_id)
        district.save!
      end
    else
      puts "District exists!"
    end
  end

  desc "This is import data to table villages"
  task village: :environment do
    unless Village.count == 10603
      File.open('./dump/villages.txt', 'r').map do |line|
        id, name, type, district_id = line.strip.split("\t")
        id = id.gsub("(","").gsub(",","").gsub("'","").to_i
        name = name.gsub(",","").gsub("'","")
        type = type.gsub(",","").gsub("'","")
        district_id = district_id.gsub(",","").gsub("'","").gsub(")","").gsub(";","").to_i
        village = Village.new(id: id, name: name, village_type: type, district_id: district_id)
        village.save!
      end
    else
      puts "Village exists!"
    end
  end

end
