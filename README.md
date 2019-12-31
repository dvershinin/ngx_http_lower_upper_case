# NGINX Case module

This module simply uppercases or lowercases a string and saves it into a new variable.

It knows only two directives: `upper` and `lower`.

## Examples

1. Redirect uppercase to lowercase URLs

        lower $uri_lower $uri;
    
        location ~ [A-Z] {
            return 301 http://localhost$uri_lower;
        }

2. Set variables 

        set $var1 "hello";
        set $var2 "WORLD";

        upper $var3 "$var1 $var2"; # $var3 will be "HELLO WORLD"
        lower $var4 "$var1 $var2"; # $var4 will be "hello world"

