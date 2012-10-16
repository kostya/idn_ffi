#LibIdn FFI ruby binding

```
sudo apt-get install libidn11
```

Gemfile:
```ruby
gem 'idn_ffi'
```

```ruby
IDNFFI.to_ascii "топ-site.рф"
=> "xn---site-iyehw.xn--p1ai"

IDNFFI.to_unicode "xn---site-iyehw.xn--p1ai"
=> "топ-site.рф"
```
