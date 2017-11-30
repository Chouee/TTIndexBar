# TTIndexBar

A custom UITableView Index that allows setting of colors.

# How to use

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

self.indexBar.textColor = [UIColor redColor];
self.indexBar.selectedTextColor = [UIColor greenColor];
self.indexBar.selectedBackgroundColor = [UIColor yellowColor];
self.indexBar.detailViewDrawColor = [UIColor cyanColor];
self.indexBar.detailViewTextColor = [UIColor orangeColor];

[self.indexBar setIndexes:[NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J", nil]];
```

