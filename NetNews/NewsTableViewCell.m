//
//  NewsTableViewCell.m
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "NewsTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface NewsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgextra;

@end

@implementation NewsTableViewCell

- (void)setModel:(NewsModel *)model{
    _model = model;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    
    self.titleLabel.text = model.title;
    
    self.digestLabel.text = model.digest;
    
    self.replyCountLabel.text = [NSString stringWithFormat:@"%d跟帖",model.replyCount.intValue];
    
    self.sourceLabel.text = model.source;
    
    if (model.imgextra) {
        [model.imgextra enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [self.imgextra[idx] sd_setImageWithURL:[NSURL URLWithString:obj[@"imgsrc"]]];
            
        }];
    }
    
    //iOS7可能需要手动刷新一下控件的自动布局(iOS9也必须刷新，否则出现第一次加载不隐藏digest)
    [self.titleLabel layoutIfNeeded];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat titleWidth = [self.model.title sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].width;
    if (titleWidth > self.titleLabel.bounds.size.width) {
        self.digestLabel.hidden = YES;
    }
}

+ (NSString *)getReuseIdentifyWithNewsModel:(NewsModel *)model{
    NSString *identifier = @"newsCell1";
    if (model.imgType) {
        identifier = @"newsCell2";
    }else if (model.imgextra){
        identifier = @"newsCell3";
    }
    
    return identifier;
}

+ (CGFloat)getRowHeightWithNewsModel:(NewsModel *)model{

    CGFloat rowHeight = 100;
    
    if (model.imgType) {
        rowHeight = 160;
    }else if (model.imgextra){
        rowHeight = 150;
    }
    
    return rowHeight;
}

@end
