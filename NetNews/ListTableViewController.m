//
//  ListTableViewController.m
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "ListTableViewController.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"

@interface ListTableViewController ()
@property (nonatomic,strong) NSArray<NewsModel *> *newsList;
@end

@implementation ListTableViewController
- (void)setNewsList:(NSArray<NewsModel *> *)newsList{
    _newsList = newsList;
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NewsModel newsListWithSuccessBlock:^(NSArray *array) {
        self.newsList = array;
    } errorBlock:^{
        NSLog(@"error");
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell1" forIndexPath:indexPath];
    
    cell.model = self.newsList[indexPath.row];
    
    return cell;
}


@end
