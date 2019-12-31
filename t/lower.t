use Test::Nginx::Socket 'no_plan';

run_tests();

__DATA__

=== TEST 1: lowercase basic
--- config
    set $foo "BAR";
    lower $foo_l "$foo";
    location = /hello {
        return 200 "$foo_l\n";
    }
--- request
    GET /hello
--- response_body
bar


=== TEST 2: lowercase redirect
--- config
    lower $uri_l $uri;

    location ~ [A-Z] {
        return 301 http://localhost$uri_l;
    }

--- request
    GET /HELLO
--- error_code: 301
--- response_headers
Location: http://localhost/hello

