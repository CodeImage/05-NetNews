//
//  LooperCollectionViewCell.m
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LooperCollectionViewCell.h"
#import <UIImageView+WebCache.h>


@interface LooperCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end
@implementation LooperCollectionViewCell
- (void)setModel:(LooperModel *)model{
    _model = model;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    
    self.label.text = model.title;
    
    
    self.pageControl.currentPage = self.tag;
}

@end
