# 1. 先創 空資料夾 extracts
    mkdir extracts
# 2. 執行解壓縮腳本
    ```
    sh uzip.sh exhibitions extracts
    ```
    * exhibiitions是放網站壓縮檔的資料夾
    * extracts 是放解壓縮檔案的資料夾
# 3. 將解壓縮的檔案放到 /var/www/html/
    ```
    cd extracts
    cp -R `ls -SF` /var/www/hmtl
    ```
# 4. 產生vhost.conf
    ```
    python create_vhsot_conf.py
    ```
    * 如須修改請更改 第4行的extracts 改成自己放解壓縮的資料夾，以及DocumentRoot和Directory的 public/改成有 index開頭的資料夾路徑，若在網站根目錄底下 就直接拿掉public/的文字
    or
    ```
    create_vhost_conf.sh extracts
    ```
    * extracts 改成自己放解壓縮的資料夾，以及DocumentRoot和Directory的 public/改成有 index開頭的資料夾路徑，若在網站根目錄底下 就直接拿掉public/的文字
# 5. 將 vhsot.conf 放到/etc/httpd/vhost/000/
    ```
    cp exhibitions.conf /etc/httpd/vhost/000/
    ```
