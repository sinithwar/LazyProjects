# LazyProjects
This area is where I make things to make my life generally easier.

##BF2LF - Big File 2 Little File
This is a nice little Ruby Gem that I developed to make processing and dividing mutch easier. Tested on several different files, so long as it has an extension it should work relatively quickly.
To use it just
`gem install BF2LF`
then
`require 'BF2LF'`
in your file.

Once you have this gem install and put inside of your application, you will need 3 things.
`C:\\The File`, character size `2500`, and then a directory for which to put the split files `C:/tmp_dir`
An application that utilizes this mixin will have something that looks like this
````
a = "C:\\The File"
a.bigfsw(2500, "C:/tmp_dir")

```
The mixin is called `bigfsw` and it will take your file, break it down into an array that contains the same amount of characters that you specify in the first parameter and in the location that you specify in the second parameter. The information is saved into an array so that it can be read back into another file as array. It is also saved as a txt file so that all written programs can use it.
