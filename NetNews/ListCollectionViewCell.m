//
//  ListCollectionViewCell.m
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "ListCollectionViewCell.h"
#import "ListTableViewController.h"
@interface ListCollectionViewCell()

// tableVc控制器必须有强指针指向，（现在没有keyWindow.rootViewController指向，所以只能此处强引用，否则创建即销毁）。
@property (nonatomic,strong) ListTableViewController *tableVc;


@end


@implementation ListCollectionViewCell
- (void)awakeFromNib{

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"List" bundle:nil];
    self.tableVc = [sb instantiateInitialViewController];
    
    [self.contentView addSubview:self.tableVc.view];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.tableVc.view.frame = self.bounds;
}
@end
