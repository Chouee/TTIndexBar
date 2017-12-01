//
//  ViewController.m
//  TTIndexBarDemo
//
//  Created by Kuaidi100 on 2017/11/30.
//  Copyright © 2017年 Chouee. All rights reserved.
//
#import "TTIndexBar.h"
#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource,TTIndexBarDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) TTIndexBar *indexBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc] init];
    for (char c='A';c<='Z';c++) {
        [_dataArray addObject:[NSString stringWithFormat:@"%c",c]];
    }
    [_tableView reloadData];
    
    _indexBar = [[TTIndexBar alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 30, 0, 30, self.view.frame.size.height)];
    _indexBar.delegate = self;
    
//    //Custom property
//    self.indexBar.textColor = [UIColor redColor];
//    self.indexBar.selectedTextColor = [UIColor greenColor];
//    self.indexBar.selectedBackgroundColor = [UIColor yellowColor];
//    self.indexBar.detailViewDrawColor = [UIColor cyanColor];
//    self.indexBar.detailViewTextColor = [UIColor orangeColor];
    
    [self.view addSubview:_indexBar];
    [_indexBar setIndexes:_dataArray];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _dataArray[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd%zd",indexPath.section,indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_indexBar.onTouch) return;
    NSIndexPath *indexPath = [_tableView indexPathForRowAtPoint:scrollView.contentOffset];
    if (indexPath) {
        [_indexBar setSelectedLabel:indexPath.section];
    }
}

#pragma mark - TTIndexBarDelegate

- (void)indexDidChanged:(TTIndexBar *)indexBar index:(NSInteger)index title:(NSString *)title
{
    [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

@end
