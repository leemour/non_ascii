Non ASCII
=========

Command-line Ruby script for detecting non-ASCII characters in files.
Only lines with detected non-ASCII characters are displayed. Detected characters are replaced with `�.`
Inspired by:

```shell
grep --color='auto' -P -n "[\x80-\xFF]" file.xml
```

Usage
-----

Files (one or more) are passed as arguments to the script:

```shell
non_ascii test.txt
```

Details
-------
Requires `colorize` gem installed

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/leemour/non_ascii/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

