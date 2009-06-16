# treetop-dcf

Easy to use parser for
[Debian Control
Files](http://www.debian.org/doc/debian-policy/ch-controlfields.html).
The format is very similar to YAML, but with some subtle differences (e.g.
YAML requires a space after field names, DCF does not).

Parsed paragraphs are returned as hashes in an array. Example:

    irb(main):001:0> require "dcf"
    => true
    irb(main):002:0> Dcf.parse "Attr: Value"
    => [{"Attr"=>"Value"}]

The parser is currently quite slow, so if the files you're parsing allows it
I'd recommend using this YAML based parser instead: http://gist.github.com/117293
Its much faster but fails on certain valid files.

## Installation

sudo gem install Chrononaut-treetop-dcf

## Acknowledgements

This project was created during Google Summer of Code 2009, as part of my project
for the [R Foundation for Statistical
Computing](http://www.r-project.org/foundation/main.html). (CRAN uses DCF for
package information, and we needed a parser written in Ruby.) Therefore, a big
thanks goes out to both the R Foundation and Google.

## Author

Bjørn Arild Mæland <bjorn.maeland at gmail.com>
