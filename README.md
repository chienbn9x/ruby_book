# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# SETUP ENVIRONMENT
* Environment:
- Install Ruby 2.7.6
- Install Rails 6.1.6
- Install Mysql ver8.0

* Run command line:
- rails db:create
- rails db:migrate
- yarn install --check-files
- rails action_text:install

* crawl data
- bundle exec rake crawl:book
- bundle exec rake import_db:category
- bundle exec rake import_db:book


# PLAN
13/07/2022 23:06 => Chuẩn bị làm mục address cho user
14/07/2022 23:13 => Đang làm page address
24/07/2022 23:55 => xong index new của address, tiếp theo sẽ làm edit/destroy của address
25/07/2022 15:37 => đang làm đổ dữ liệu ra form edit, làm tiếp
26/07/2022 00:10 => xong edit, tiếp theo sẽ làm ajax destroy
28/07/2022 00:44 => xong xoa address, xoa trong cart