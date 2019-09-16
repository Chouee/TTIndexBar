# TTIndexBar

A custom UITableView index that allows setting of colors.
自定义tableView索引条

#### 点击索引条:

![](https://github.com/Chouee/TTIndexBar/blob/master/ScreenShot.gif)

#### 滑动tableView:

![](https://github.com/Chouee/TTIndexBar/blob/master/ScreenShot2.gif)

#### 滑动索引条:

![](https://github.com/Chouee/TTIndexBar/blob/master/ScreenShot3.gif)


## How to use

Default:
```
self.indexBar = [[TTIndexBar alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 30, 0, 30, self.view.frame.size.height)];
self.indexBar.delegate = self;
[self.view addSubview:self.indexBar];
    
[self.indexBar setIndexes:[NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J", nil]];
```

Custom:
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
Delegate:
```
- (void)indexDidChanged:(TTIndexBar *)indexBar index:(NSInteger)index title:(NSString *)title;
```

