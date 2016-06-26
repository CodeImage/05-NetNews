//
//  ViewController.m
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "MainViewControllers.h"
#import "ChannelModel.h"

@interface MainViewControllers ()
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *listCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) NSArray *channelList;
@end



@implementation MainViewControllers

- (NSArray *)channelList{
    if (!_channelList) {
        _channelList = [ChannelModel channelList];
    }
    return _channelList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChannel];
}


- (void)setupChannel{
    
    CGFloat margin = 10;
    __block CGFloat labelX = margin;
    
    [self.channelList enumerateObjectsUsingBlock:^(ChannelModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UILabel *label = [UILabel new];
        label.text = obj.tname;
//        label.textColor = [UIColor redColor];
//        label.font = [UIFont systemFontOfSize:18];
        
        [label sizeToFit];
        
        CGFloat labelWidth = label.bounds.size.width;
        CGFloat labelHeight = label.bounds.size.height;
        label.frame = CGRectMake(labelX, 8, labelWidth, labelHeight);
        
        labelX += labelWidth + margin;
        
        [self.channelScrollView addSubview:label];
    }];
    
    self.channelScrollView.contentSize = CGSizeMake(labelX, self.channelScrollView.frame.size.height);
}

@end
