require 'open-uri'

namespace :import_db do
  desc "This is import data to table provinces"
  task province: :environment do
    unless Province.count == 63
      File.open('./dump/region/provinces.txt', 'r').map do |line|
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
      File.open('./dump/region/districts.txt', 'r').map do |line|
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
      File.open('./dump/region/villages.txt', 'r').map do |line|
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

  desc "Add book of category to table products"
  task book: :environment do
    Category.where(role: false).decorate.each do |category|
      sub_name = category.to_name_file
      name_file = "./dump/book/" + sub_name + ".txt"
      file = File.open(name_file)
      count = 0
      file.readlines.map do |line|
        begin
          img0, img1, title, discount, price, publication_year, authors, height, 
          width, translator, publication_company, layout, number_page, weight = line.strip.split('-+chien+-')
          next if Product.where(title: title).count > 0
          product = category.products.new
          # img
          downloaded_image0 = URI.open(img0)
          product.images.attach(io: downloaded_image0, filename: "#{sub_name}1.jpq")
          unless img1 == "empty"
            downloaded_image1 = URI.open(img1)
            product.images.attach(io: downloaded_image1, filename: "#{sub_name}2.jpg")
          end
          # title
          product.title = title
          # discount
          product.discount = discount.to_f
          # price
          product.price = price.to_f
          # publication_year
          product.publication_year = publication_year
          # authors
          product.authors = authors
          # height
          product.height = height.to_i
          # width
          product.width = width.to_i
          # translator
          product.translator = translator
          # publication_company
          product.publication_company = publication_company
          # layout
          product.layout = layout
          # number_page
          product.number_page = number_page.to_i
          # weight
          product.weight = weight.to_i

          # save
          count += 1 if product.save
        rescue
          next
        end
      end
      puts "import #{sub_name} in #{category.category.name} success #{count} record!"
      file.close
    end
  end

end

namespace :crawl do
  desc "Test shell script"
  task book: :environment do
    agent = Crawl.new.crawl_book
  end
end
