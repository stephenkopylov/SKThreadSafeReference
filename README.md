
<p align="center">
<a href="https://travis-ci.org/stephenkopylov/SKThreadSafeReference"><img src="https://travis-ci.org/stephenkopylov/SKThreadSafeReference.svg" alt="Build Status"/></a>
<a href="http://cocoapods.org/pods/SKThreadSafeReference"><img src="https://img.shields.io/cocoapods/v/SKThreadSafeReference.svg?style=flat" alt="Version"/></a>
<a href="http://cocoapods.org/pods/SKThreadSafeReference"><img src="https://img.shields.io/cocoapods/l/SKThreadSafeReference.svg?style=flat" alt="License"/></a>  
<a href="http://cocoapods.org/pods/SKThreadSafeReference"><img src="https://img.shields.io/badge/platform-ios-brightgreen.svg?style=flat" alt="Platform"/></a>  
</p>

SKThreadSafeReference - small and very simple wrapper around Realm's RLMThreadSafeReference, that makes working with non-default Realm's configuration much easier.

### Install
#### CocoaPods
```ruby
pod "SKThreadSafeReference"
```

#### Manual
Download this repo and drop this files into your project

![Screenshot](misc/screen1.png)

### Usage
Create thread-safe instance:
``` objectiveC
SKThreadSafeReference *safeReference = [SKThreadSafeReference referenceWithThreadConfined:nonSafeRealmObject];
```

pass it to another thread, and then easily get your RLMObject-instance:
``` objectiveC
Foo *nonSafeObject = safeReference.nonSafeObject;
```


### License
The MIT License (MIT)

Copyright (c) 2016 Stephen Kopylov, newonxp@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
