# TTIndexBar

<!--[![CI Status](https://img.shields.io/travis/zhouting/TTIndexBar.svg?style=flat)](https://travis-ci.org/zhouting/TTIndexBar)-->
[![Version](https://img.shields.io/cocoapods/v/TTIndexBar.svg?style=flat)](https://cocoapods.org/pods/TTIndexBar)
[![License](https://img.shields.io/cocoapods/l/TTIndexBar.svg?style=flat)](https://cocoapods.org/pods/TTIndexBar)
[![Platform](https://img.shields.io/cocoapods/p/TTIndexBar.svg?style=flat)](https://cocoapods.org/pods/TTIndexBar)

TTIndexBar is a UITableView index bar that allows users to customize styles.

## Example
1、单击索引条时:

![](https://img-service.csdnimg.cn/img_convert/5aaf65a7fb82d3b51beb47ddcd904bd2.png)

2、滑动tableView时:

![](https://img-service.csdnimg.cn/img_convert/2eb7f5ae2bcf1e9ddba5b54f4a5683aa.png)

3、在索引条上滑动时:

![](https://img-service.csdnimg.cn/img_convert/104095921256bca0c2fed7bf4832c2ff.png)

## Installation

TTIndexBar is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TTIndexBar'
```

## Requirements
iOS 9.0+ 

## How to use

Default:
```
self.indexBar = [[TTIndexBar alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 30, 0, 30, self.view.frame.size.height)];
self.indexBar.delegate = self;
[self.view addSubview:self.indexBar];
    
[self.indexBar setIndexes:[NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J", nil]];
```

Custom style:
```
self.indexBar = [[TTIndexBar alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 30, 0, 30, self.view.frame.size.height)];
self.indexBar.delegate = self;
[self.view addSubview:self.indexBar];   

//Custom property
self.indexBar.textColor = [UIColor redColor];
self.indexBar.selectedTextColor = [UIColor greenColor];
self.indexBar.selectedBackgroundColor = [UIColor yellowColor];
self.indexBar.detailViewDrawColor = [UIColor cyanColor];
self.indexBar.detailViewTextColor = [UIColor orangeColor];

[self.indexBar setIndexes:[NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J", nil]];
```

Delegate callback:
```
- (void)indexDidChanged:(TTIndexBar *)indexBar index:(NSInteger)index title:(NSString *)title;
```

## Author

zhouting, choue_mails@163.com

## License

TTIndexBar is available under the MIT license. See the LICENSE file for more info.
