0. ### Cơ chế xử lý (tham khảo)
>### Tạo Job

 >Thông qua gọi các hàm tạo Job, sẽ sinh ra 1 Hash tương ứng với job, chuyển đổi Hash thành JSON String và đẩy String đấy vào hàng đợi của Redis.

 >Các tham số truyền vào của job chỉ đơn thuần là các kiểu dữ liệu JSON đơn giản (numbers, strings, boolean, array, hash)

 >Các đối tượng phức tạp hơn (như Date, Time, các model Active Record) sẽ không được chuyển đổi một cách thích hợp

 >### Redis

 >Redis cung cấp nơi chứa dữ liệu cho Sidekiq. Nó giữ tất cả dữ liệu job trong thời gian thực và lịch sử của dữ liệu trong Sidekiq's Web

 >### Server

 >Mỗi server Sidekiq lấy các job từ hàng đợi trong Redis và thực thi chúng. Giống như các tiến trình của trang web, Sidekiq tải lại framework Rails cho các job và workers có đầy đủ các Rails API bao gồm Active Record để thực hiện. Server sẽ khởi tạo các worker và truyền vào các tham số. Mọi thứ sẽ được thực hiện dựa theo mục đích của job.

 > ### Study case: Đặc biệt hữu ích cho công việc gửi mail cho nhiều user.

https://qiita.com/nysalor/items/94ecd53c2141d1c27d1f
https://viblo.asia/p/background-processing-in-ruby-on-rails-part-1-wznVGLVORZOe
https://github.com/mperham/sidekiq/wiki/Advanced-Options
1. ### Generate worker
   `rails g sidekiq:worker Hard # will create app/workers/hard_worker.rb`
2. ### sidekiq_options  
    `sidekiq_options queue: :event_worker, retry: 5, backtrace: true`

    - :backtrace - Xác định có hay không lưu các error backtrace để thử payload lại, mặc định là false. các error backtrace được dùng cho mục đích hiển thị trong Sidekiq web UI. Ngoài ra, bạn có thể chỉ định số dòng để tiết kiệm (ví dụ, backtrace: 15).
    - :queue - Tên của hàng đợi cho worker, mặc định để "default"
    - :retry - Theo mặc định, một worker có thể thử lại các jobs cho đến khi nó hoàn thành. Thiết lập tùy chọn :retry để false sẽ hướng dẫn Sidekiq chạy một job chỉ một lần. Ngoài ra, bạn có thể chỉ định tối đa số lần một job được thử lại (ví dụ, retry:5).      
3. ### To start sidekiq
   `bundle exec sidekiq -d -L log/sidekiq.log -C config/sidekiq.yml -e production`

    -d, Daemonize process
    -L, path to writable logfile
    -C, path to YAML config file
    -e, Application environment

4. ### WebUI Terminal
   http://localhost:3000/sidekiq

5. ### Push to Queue
   `HardWorker.perform_async ("params")`

6. ### Push to Queue after inteval
   `HardWorker.perform_in (1.hour, "params")`

7. ### Config Client and Server-adapter

8. ### Config yml file
  ```
  :verbose: false
  :pidfile: ./tmp/pids/sidekiq.pid
  :logfile: ./log/sidekiq.log
  :concurrency:  25
  :queues:
    - default
    - mailer_wk
  ```
