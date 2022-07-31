class Crawl
  def initialize
    @agent = Mechanize.new
    puts "Thanh cong"
  end

  def crawl_book
    for type in 1..CATEGORY_COUNT
      executive = true
      name_file = ""

      case type
      when TIEU_THUYET
        url = "https://www.fahasa.com/sach-trong-nuoc/van-hoc-trong-nuoc/tieu-thuyet.html"
        name_file = "tieu_thuyet.txt"
      when TRUYEN_NGAN_TAN_VAN
        url = "https://www.fahasa.com/sach-trong-nuoc/van-hoc-trong-nuoc/truyen-ngan-tan-van.html"
        name_file = "truyen_ngan_tan_van.txt"
      when NGON_TINH
        url = "https://www.fahasa.com/sach-trong-nuoc/van-hoc-trong-nuoc/ngon-tinh.html"
        name_file = "ngon_tinh.txt"
      when TRINH_THAM_KIEM_HIEP
        url = "https://www.fahasa.com/sach-trong-nuoc/van-hoc-trong-nuoc/truyen-trinh-tham-vien-tuong.html"
        name_file = "truyen_trinh_tham_kiem_hiep.txt"
      when TAC_PHAM_KINH_DIEN
        url = "https://www.fahasa.com/sach-trong-nuoc/van-hoc-trong-nuoc/tac-pham-kinh-dien.html"
        name_file = "tac_pham_kinh_dien.txt"
      when HUYEN_BI_GIA_TUONG_KINH_DI
        url = "https://www.fahasa.com/sach-trong-nuoc/van-hoc-trong-nuoc/huyen-bi-gia-tuong-kinh-di.html"
        name_file = "huyen_bi_gia_tuong_kinh_di.txt"
      when THO_CA_TUC_NGU_CA_DAO_THANH_NGU
        url = "https://www.fahasa.com/sach-trong-nuoc/van-hoc-trong-nuoc/tho-ca-tuc-ngu-ca-dao-thanh-ngu.html"
        name_file = "tho_ca_tuc_ngu_ca_dao_thanh_ngu.txt"
      when DU_KY
        url = "https://www.fahasa.com/sach-trong-nuoc/van-hoc-trong-nuoc/du-ky.html"
        name_file = "du_ky.txt"
      when HAI_HUOC_TRUYEN_CUOI
        url = "https://www.fahasa.com/sach-trong-nuoc/van-hoc-trong-nuoc/hai-huoc-truyen-cuoi.html"
        name_file = "hai_huoc_truyen_cuoi.txt"
      when TRUYEN_TRANH
        url = "https://www.fahasa.com/sach-trong-nuoc/van-hoc-trong-nuoc/truyen-tranh.html"
        name_file = "truyen_tranh.txt"
      when COMBO_VAN_HOC
        url = "https://www.fahasa.com/sach-trong-nuoc/van-hoc-trong-nuoc/combo-van-hoc.html"
        name_file = "combo_van_hoc.txt"
      when QUAN_TRI_LANH_DAO
        url = "https://www.fahasa.com/sach-trong-nuoc/kinh-te-chinh-tri-phap-ly/quan-tri-lanh-dao.html"
        name_file = "quan_tri_lanh_dao.txt"
      when NHAN_VAT_BAI_HOC_KINH_DOANH
        url = "https://www.fahasa.com/sach-trong-nuoc/kinh-te-chinh-tri-phap-ly/nhan-vat-bai-hoc-kinh-doanh.html"
        name_file = "nhan_vat_bai_hoc_kinh_doanh.txt"
      when MERKETING_BAN_HANG
        url = "https://www.fahasa.com/sach-trong-nuoc/kinh-te-chinh-tri-phap-ly/marketing-ban-hang.html"
        name_file = "marketing_ban_hang.txt"
      when PHAN_TICH_KINH_TE
        url = "https://www.fahasa.com/sach-trong-nuoc/kinh-te-chinh-tri-phap-ly/phan-tich-kinh-te.html"
        name_file = "phan_tich_kinh_te.txt"
      when KHOI_NGHIEP_LAM_GIAU
        url = "https://www.fahasa.com/sach-trong-nuoc/kinh-te-chinh-tri-phap-ly/khoi-nghiep-lam-giau.html"
        name_file = "khoi_nghiep_lam_giau.txt"
      when TAI_CHINH_NGAN_HANG
        url = "https://www.fahasa.com/sach-trong-nuoc/kinh-te-chinh-tri-phap-ly/tai-chinh-ngan-hang.html"
        name_file = "tai_chinh_ngan_hang.txt"
      when CHUNG_KHOAN_BAT_DONG_SAN_DAU_TU
        url = "https://www.fahasa.com/sach-trong-nuoc/kinh-te-chinh-tri-phap-ly/chung-khoan-bat-dong-san-dau-tu.html"
        name_file = "chung_khoan_bat_dong_san_dau_tu.txt"
      when KE_TOAN_KIEM_TOAN_THUE
        url = "https://www.fahasa.com/sach-trong-nuoc/kinh-te-chinh-tri-phap-ly/ke-toan-kiem-toan-thue.html"
        name_file = "ke_toan_kiem_toan_thue.txt"
      when KY_NANG_SONG
        url = "https://www.fahasa.com/sach-trong-nuoc/tam-ly-ky-nang-song/ky-nang-song.html"
        name_file = "ky_nang_song.txt"
      when TAM_LY
        url = "https://www.fahasa.com/sach-trong-nuoc/tam-ly-ky-nang-song/tam-ly.html"
        name_file = "tam_ly.txt"
      when SACH_CHO_TUOI_MOI_LON
        url = "https://www.fahasa.com/sach-trong-nuoc/tam-ly-ky-nang-song/sach-cho-tuoi-moi-lon.html"
        name_file = "sach_cho_tuoi_moi_lon.txt"
      when REN_LUYEN_NHAN_CACH
        url = "https://www.fahasa.com/sach-trong-nuoc/tam-ly-ky-nang-song/ren-luyen-nhan-cach.html"
        name_file = "ren_luyen_nhan_cach.txt"
      when CHICKEN_SOUP_HAT_GIONG_TAM_HON
        url = "https://www.fahasa.com/sach-trong-nuoc/tam-ly-ky-nang-song/chicken-soup-hat-giong-tam-hon.html"
        name_file = "chicken_soup_hat_giong_tam_hon.txt"
      when CAM_NANG_LAM_CHA_ME
        url = "https://www.fahasa.com/sach-trong-nuoc/nuoi-day-con/cam-nang-lam-cha-me.html"
        name_file = "cam_nang_lam_cha_me.txt"
      when PHAT_TRIEN_KY_NANG_TRI_TUE_CHO_TRE
        url = "https://www.fahasa.com/sach-trong-nuoc/nuoi-day-con/phat-trien-ky-nang-tri-tue-cho-tre.html"
        name_file = "phat_trien_ky_nang_tri_tue_cho_tre.txt"
      when PHUONG_PHAP_GIAO_DUC_TRE_CAC_NUOC
        url = "https://www.fahasa.com/sach-trong-nuoc/nuoi-day-con/phuong-phap-giao-duc-cac-nuoc.html"
        name_file = "phuong_phap_giao_duc_tre_cac_nuoc.txt"
      when DINH_DUONG_SUC_KHOE_CHO_TRE
        url = "https://www.fahasa.com/sach-trong-nuoc/nuoi-day-con/dinh-duong-suc-khoe-cho-tre.html"
        name_file = "dinh_duong_suc_khoe_cho_tre.txt"
      when GIAO_DUC_TRE_TUOI_TEEN
        url = "https://www.fahasa.com/sach-trong-nuoc/nuoi-day-con/giao-duc-tre-tuoi-teen.html"
        name_file = "giao_duc_tre_tuoi_teen.txt"
      when DANH_CHO_ME_BAU
        url = "https://www.fahasa.com/sach-trong-nuoc/nuoi-day-con/danh-cho-me-bau.html"
        name_file = "danh_cho_me_bau.txt"
      when TRUYEN_THIEU_NHI
        url = "https://www.fahasa.com/sach-trong-nuoc/thieu-nhi/truyen-thieu-nhi.html"
        name_file = "truyen_thieu_nhi.txt"
      when KIEN_THUC_BACH_KHOA
        url = "https://www.fahasa.com/sach-trong-nuoc/thieu-nhi/kien-thuc-bach-khoa.html"
        name_file = "kien_thuc_bach_khoa.txt"
      when KIEN_THUC_KY_NANG_SONG_CHO_TRE
        url = "https://www.fahasa.com/sach-trong-nuoc/thieu-nhi/kien-thuc-ky-nang-song-cho-tre.html"
        name_file = "kien_thuc_ky_nang_song_cho_tre.txt"
      when TO_MAU_LUYEN_CHU
        url = "https://www.fahasa.com/sach-trong-nuoc/thieu-nhi/to-mau-luyen-chu.html"
        name_file = "to_mau_luyen_chu.txt"
      when TU_DIEN_THIEU_NHI
        url = "https://www.fahasa.com/sach-trong-nuoc/thieu-nhi/tu-dien-thieu-nhi.html"
        name_file = "tu_dien_thieu_nhi.txt"
      when FLASHCARD_THE_HOC_THONG_MINH
        url = "https://www.fahasa.com/sach-trong-nuoc/thieu-nhi/flashcard.html"
        name_file = "flashcard_the_hoc_thong_minh.txt"
      when SACH_NOI
        url = "https://www.fahasa.com/sach-trong-nuoc/thieu-nhi/sach-noi.html"
        name_file = "sach_noi.txt"
      when TAP_CHI_THIEU_NHI
        url = "https://www.fahasa.com/sach-trong-nuoc/thieu-nhi/tap-chi.html"
        name_file = "tap_chi_thieu_nhi.txt"
      when CAU_CHUYEN_CUOC_DOI
        url = "https://www.fahasa.com/sach-trong-nuoc/tieu-su-hoi-ky/cau-chuyen-cuoc-doi.html"
        name_file = "cau_chuyen_cuoc_doi.txt"
      when NGHE_THUAT_GIAI_TRI
        url = "https://www.fahasa.com/sach-trong-nuoc/tieu-su-hoi-ky/nghe-thua-giai-tri.html"
        name_file = "nghe_thuat_giai_tri.txt"
      when LICH_SU
        url = "https://www.fahasa.com/sach-trong-nuoc/tieu-su-hoi-ky/lich-su.html"
        name_file = "lich_su.txt"
      when CHINH_TRI
        url = "https://www.fahasa.com/sach-trong-nuoc/tieu-su-hoi-ky/chinh-tri.html"
        name_file = "chinh_tri.txt"
      when KINH_TE
        url = "https://www.fahasa.com/sach-trong-nuoc/tieu-su-hoi-ky/kinh-te.html"
        name_file = "kinh_te.txt"
      when THE_THAO
        url = "https://www.fahasa.com/sach-trong-nuoc/tieu-su-hoi-ky/the-thao.html"
        name_file = "the_thao.txt"
      when SACH_THAM_KHAO
        url = "https://www.fahasa.com/sach-trong-nuoc/giao-khoa-tham-khao/lop-2.html"
        name_file = "sach_tham_khao.txt"
      when MAU_GIAO
        url = "https://www.fahasa.com/sach-trong-nuoc/giao-khoa-tham-khao/mau-giao.html"
        name_file = "mau_giao.txt"
      when SACH_GIAO_KHOA
        url = "https://www.fahasa.com/sach-trong-nuoc/giao-khoa-tham-khao/sach-giao-khoa.html"
        name_file = "sach_giao_khoa.txt"
      when SACH_GIAO_VIEN
        url = "https://www.fahasa.com/sach-trong-nuoc/giao-khoa-tham-khao/sach-giao-vien.html"
        name_file = "sach_giao_vien.txt"
      when DAI_HOC
        url = "https://www.fahasa.com/sach-trong-nuoc/giao-khoa-tham-khao/dai-hoc.html"
        name_file = "dai_hoc.txt"
      when TIENG_ANH
        url = "https://www.fahasa.com/sach-trong-nuoc/sach-hoc-ngoai-ngu/tieng-anh.html"
        name_file = "tieng_anh.txt"
      when TIENG_NHAT
        url = "https://www.fahasa.com/sach-trong-nuoc/sach-hoc-ngoai-ngu/tieng-nhat.html"
        name_file = "tieng_nhat.txt"
      when TIENG_HOA
        url = "https://www.fahasa.com/sach-trong-nuoc/sach-hoc-ngoai-ngu/tieng-hoa.html"
        name_file = "tieng_hoa.txt"
      when TIENG_HAN
        url = "https://www.fahasa.com/sach-trong-nuoc/sach-hoc-ngoai-ngu/tieng-han.html"
        name_file = "tieng_han.txt"
      when TIENG_VIET_CHO_NGUOI_NUOC_NGOAI
        url = "https://www.fahasa.com/sach-trong-nuoc/sach-hoc-ngoai-ngu/tieng-viet-cho-nguoi-nuoc-ngoai.html"
        name_file = "tieng_viet_cho_nguoi_nuoc_ngoai.txt"
      when TIENG_PHAP
        url = "https://www.fahasa.com/sach-trong-nuoc/sach-hoc-ngoai-ngu/tieng-phap.html"
        name_file = "tieng_phap.txt"
      when TIENG_DUC
        url = "https://www.fahasa.com/sach-trong-nuoc/sach-hoc-ngoai-ngu/tieng-duc.html"
        name_file = "tieng_duc.txt"
      when NGOAI_NGU_KHAC
        url = "https://www.fahasa.com/sach-trong-nuoc/sach-hoc-ngoai-ngu/ngoai-ngu-khac.html"
        name_file = "ngoai_ngu_khac.txt"
      else
        executive = false
        puts "Khong dung lua chon"
      end
      
      if executive
        page = @agent.get(url)

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

            content_file += "#{result.join('-+chien+-')}\n"
            count += 1
          rescue
            next
          end
        end

        name_file = "./dump/book/" + name_file
        file = File.new(name_file, "w+")
        file.puts(content_file)
        file.close

        puts "crawl #{name_file[0..-5]} thanh cong #{count} record"
      end
    end
  end
end
