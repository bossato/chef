chef
============

RubyとChefのインストール
--

ライブラリインストール

```
$ yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libffi-devel openssl-devel git vim tmux
$ wget http://pyyaml.org/download/libyaml/yaml-0.1.5.tar.gz
$ tar xvzf yaml-0.1.5.tar.gz
$ cd yaml-0.1.5
$ ./configure
$ make
$ make install
$ whereis libyaml
libyaml: /usr/local/lib/libyaml.la /usr/local/lib/libyaml.a /usr/local/lib/libyaml.so
```

Ruby1.9インストール

```
$ wget http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p545.tar.gz
$ tar xvzf ruby-1.9.3-p545.tar.gz
$ cd ruby-1.9.3-p545
$ ./configure --with-opt-dir=/usr/lib --disable-install-doc
$ make
$ make install
$ ruby -v
ruby 1.9.3p545 (2014-02-24 revision 45159) [x86_64-linux]
```

Chefインストール

```
$ gem install rdoc
$ gem install chef
$ gem install knife-solo
$ chef-solo -v
Chef: 11.10.4
```

knife設定
--

knifeコマンドの初期設定を行う。

```
$ knife configure
// この後は基本Enterを押せばOK
```

solo.rb作成
--

chef-soloコマンドの設定ファイルでリポジトリ直下に作成する。各パスは適時書き換える。

```
$ cat solo.rb

file_cache_path           "/tmp/chef-repo"
data_bag_path             "/root/chef-repo/data_bags"
encrypted_data_bag_secret "/root/chef-repo/data_bag_key"
cookbook_path             [ "/root/chef-repo/site-cookbooks",
                            "/root/chef-repo/cookbooks" ]
role_path                 "/root/chef-repo/roles"
```

nodeの変更
--

必要なクックブックを記述する。

```
$ cat nodes/localhost.json

// localhost.json
{
    "run_list": [
        //"recipe[apache]"
        //"recipe[mysql]"
        "recipe[php]"
    ]
}
```

attributesの変更
--

各クックブックのattributesを変更してミドルウェアの設定ファイルを変更する。

例)MySQLのメモリサイズ

```
$ cat site-cookbooks/mysql/attributes/default.rb | grep size
default['mysql']['thread_cache_size']       = 0
default['mysql']['max_heap_table_size']     = "16M"
default['mysql']['sort_buffer_size']        = "2M"
default['mysql']['read_buffer_size']        = "128K"
default['mysql']['read_rnd_buffer_size']    = "256K"
default['mysql']['join_buffer_size']        = "128M"
default['mysql']['query_cache_size']        = 0
default['mysql']['innodb_buffer_pool_size'] = "128M"
default['mysql']['innodb_log_file_size']    = "5M"
default['mysql']['innodb_log_buffer_size']  = "8M"
```

chef-soloの実行
--

chef-soloコマンドで指定したクックブックを実行する。

```
$ chef-solo -c solo.rb -j nodes/localhost.json

// 実行ログがひたすら流れる
```
