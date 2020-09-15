# TTIndexBar

A custom UITableView index that allows setting of colors.
（自定义UITableView索引条）

#### 单击索引条时:

![](https://img-service.csdnimg.cn/img_convert/5aaf65a7fb82d3b51beb47ddcd904bd2.png)

#### 滑动tableView时:

![](https://img-service.csdnimg.cn/img_convert/2eb7f5ae2bcf1e9ddba5b54f4a5683aa.png)

#### 在索引条上滑动时:

![](https://img-service.csdnimg.cn/img_convert/104095921256bca0c2fed7bf4832c2ff.png)


## 如何使用

默认样式:
```
self.indexBar = [[TTIndexBar alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 30, 0, 30, self.view.frame.size.height)];
self.indexBar.delegate = self;
[self.view addSubview:self.indexBar];
    
[self.indexBar setIndexes:[NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J", nil]];
```

自定义样式:
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
代理回调:
```
- (void)indexDidChanged:(TTIndexBar *)indexBar index:(NSInteger)index title:(NSString *)title;
```

