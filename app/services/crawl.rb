class Crawl
  def initialize
    @agent = Mechanize.new
    puts "Thanh cong"
  end

  def crawl_book(url, name_category)
    page = @agent.get(url)
    name_file = File.basename(url).gsub("html", "txt").gsub('-', '_')
    puts "Start crawl book to #{name_file} of #{name_category}"

    li_books = page.search "ul#products_grid li"
    content_file = ""
    count = 0
    li_books.each do |li_book|
      begin
        link = li_book.search("a.product-image").attr("href").text
        result = []
        
        current_book = @agent.get(link)
        imgs = current_book.search("a.include-in-gallery")
        result << imgs[0].attr("href")
        result << (imgs.size > 1 && imgs[1].attr("href").present? ? imgs[1].attr("href") : "empty")
        # title
        result << current_book.search("h1").text.strip
        discount = current_book.at("span.discount-percent")
        # discount & price
        if discount
          result << discount.text[1..2]
          result << current_book.at("p.old-price span.price").text.gsub('.', '')[0..-3]
        else
          result << "0"
          result << current_book.at("p.special-price span.price").text.gsub('.', '')[0..-3]
        end
        # book_infor
        book_infor = current_book.search("div.product_view_tab_content_ad")
        # publication_year
        result << book_infor.search("td.data_publish_year").text.strip
        # authors
        result << book_infor.search("td.data_author").text.strip
        # size
        size = book_infor.search("td.data_size").text.strip.split(' ')
        # height & width
        result << size[0]
        result << size[2]
        # translator
        result << book_infor.search("td.data_translator").text.strip.gsub("\n", "")
        # publication_company
        result << book_infor.search("td.data_publisher").text.strip
        # layout
        result << book_infor.search("td.data_book_layout").text.strip
        # number_page
        result << book_infor.search("td.data_qty_of_page").text.strip
        # weight
        result << book_infor.search("td.data_weight").text.strip
        #category
        result << name_category

        content_file += "#{result.join('-+chien+-')}\n"
        count += 1
      rescue
        next
      end
    end

    puts "Crawl book to #{name_file} of #{name_category} !!! DONE with #{count} record !!!"

    name_file = "./dump/book/" + name_file
    file = File.new(name_file, "w+")
    file.puts(content_file)
    file.close
  end

  def crawl_categories
    url_root = "https://www.fahasa.com/sach-trong-nuoc.html"
    # parent category
    content_file, url_categories = handle_category(url_root, "true")

    # child category
    url_categories.each do |name, url_category|
      begin
        result1, result2 = handle_category(url_category)
        content_file.concat("\n#{result1}")

        result2.each do |name_chield, url_book|
          crawl_book(url_book, name_chield)
        end
      rescue
        next
      end
    end
    
    name_file = "./dump/category/categories.txt"
    file = File.new(name_file, "w+")
    file.puts(content_file)
    file.close
  end

  private

  def handle_category(url, root = "")
    if url
      puts "Start crawl #{root.present? ? "parent" : "child"} category #{url}!!!"
      url_categories = {}
      result = []
      page = @agent.get(url)
      list_category = page.search "ol#children-categories > li"
      name_parent_category = page.search("div#current-category > span").text.strip
      list_category.each do |category|
        category_a = category.search("a")
        name = category_a.text.strip
        result.push("#{name}-+chien+-#{root}-+chien+-#{name_parent_category if root.blank?}")
        href = category_a.attr("href").text.strip
        url_categories[name] = href
      end
      content_file = result.join("\n")
      puts "Crawl #{root.present? ? "parent" : "child"} category #{url} ---- DONE!!!"

      return content_file, url_categories
    end
  end
end
