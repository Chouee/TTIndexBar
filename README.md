# TTIndexBar
A custom UITableView Index that allows setting of colors.

# How to use?
Default:
    self.indexBar = [[TTIndexBar alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 30, 0, 30, SCREEN_HEIGHT)];
    self.indexBar.delegate = self;
    [self.view addSubview:self.indexBar];

Custom:
    self.indexBar = [[TTIndexBar alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 30, 0, 30, SCREEN_HEIGHT)];
    self.indexBar.delegate = self;
    
    self.indexBar.textColor = [UIColor redColor];
    self.indexBar.selectedTextColor = [UIColor greenColor];
    self.indexBar.selectedBackgroundColor = [UIColor yellowColor];
    self.indexBar.detailViewDrawColor = [UIColor cyanColor];
    self.indexBar.detailViewTextColor = [UIColor orangeColor];
    
    [self.view addSubview:self.indexBar];

