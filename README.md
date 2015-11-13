# DataBindingLib


[![CI Status](http://img.shields.io/travis/Halin/DataBindingLib.svg?style=flat)](https://travis-ci.org/Halin/DataBindingLib)
[![Version](https://img.shields.io/cocoapods/v/DataBindingLib.svg?style=flat)](http://cocoapods.org/pods/DataBindingLib)
[![License](https://img.shields.io/cocoapods/l/DataBindingLib.svg?style=flat)](http://cocoapods.org/pods/DataBindingLib)
[![Platform](https://img.shields.io/cocoapods/p/DataBindingLib.svg?style=flat)](http://cocoapods.org/pods/DataBindingLib)

这是一个参考自Android DataBinding (http://developer.android.com/tools/data-binding/guide.html) 的库,其用法与Android 的 DataBinding非常相似
通过 xib 的 User Defined Runtime Attributes 实现对model的绑定(类似于Android xml 的 binding),设置绑定模型与绑定方法,

This is a lib base on 'Android DataBinding' (http://developer.android.com/tools/data-binding/guide.html) ,
It use like Android DataBinding ,
You can bind model and method through  'User Defined Runtime Attributes' 

Forgive my poor English , There is no English Document and Notes , 
but if you interested ,just send me a Email,i will tell you how to use and how it work . and hopely you can help me to write English document and notes...
My Email address : d.halin.lee@gmail.com


## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

#### 1.添加模型,并在模型的dealloc方法中调用 DataBindingUtil 的 unbindModel: 方法

```objective-c
#import <DataBindingLib/DataBindingLib.h>
@implementation ExampleModel

- (void)dealloc{
[[DataBindingUtil dataBindingUtil] unbindModel:self];
}

@end
```

#### 2.在 User Defined Runtime Attributes 添加对应的 model 类型(类名),已经监听的property及当监听改变时调用的方法

```objective-c
KeyPath            |         Value       |    说明
----------------------------------------------------
BindType           |      ExampleModel   |    对应绑定model的名称如:Example Model        
BindMethod:string  |      setText:       |    BindMethod: 对应监听的Property名称,及当property改变后调用的方法 此处将监听string 这个 property  setText:当string改变后,以string的值为参数调用setText:这个方法
```

#### 3.实现绑定,构造一个 model 并调用 bindModel: 绑定模型 model相当于 Android DataBinding 的 Binding

```objective-c
_exampleModel = [[ExampleModel alloc] init];
[[DataBindingUtil dataBindingUtil] bindModel:_exampleModel forView:self.view];

_exampleModel.string = @"Test Start";

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
_exampleModel.string = @"String has been changer by binder";
});
```

## Requirements

## Installation

DataBindingLib is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DataBindingLib"
```

## Author

Halin, d.halin.lee@gmail.com

## License

DataBindingLib is available under the MIT license. See the LICENSE file for more info.-Warc-performSelector-leaks
