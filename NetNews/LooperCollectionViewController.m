//
//  LooperCollectionViewController.m
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LooperCollectionViewController.h"
#import "LooperModel.h"
#import "LooperCollectionViewCell.h"

@interface LooperCollectionViewController ()
@property (nonatomic,strong) NSArray<LooperModel *> *looperList;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@end

@implementation LooperCollectionViewController

// 由于self.looperList是通过block传值回调的，所以不能懒加载，需要重写setter刷新数据
- (void)setLooperList:(NSArray<LooperModel *> *)looperList{
    _looperList = looperList;
    
    [self.collectionView reloadData];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LooperModel looperListWithSuccessBlock:^(NSArray *array) {
        self.looperList = array;
        
    } errorBlock:^{
        NSLog(@"error");
    }];
 
    // 不能放这里滚，因为viewDidLoad结束时可能还没有looperList（异步回调的）
//    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];

    [self setupUI];
}

- (void)setupUI{
    
    self.flowLayout.itemSize = self.collectionView.frame.size;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 0;
    
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.looperList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LooperCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"looperCollectionCell" forIndexPath:indexPath];
    
    cell.tag = indexPath.item;
    
    cell.model = self.looperList[indexPath.item];
    
    return cell;
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    NSInteger item = index % self.looperList.count;
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:1] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}
@end
