//
//  ChannelModel.m
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "ChannelModel.h"

@implementation ChannelModel
+ (instancetype)channelModelWithDict:(NSDictionary *)dict{
    ChannelModel *model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

+ (NSArray *)channelList{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSString *rootKey = dict.keyEnumerator.nextObject;
    NSArray *tempArr = dict[rootKey];
    
    NSMutableArray *mutable = [NSMutableArray array];
    [tempArr enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        ChannelModel *model = [ChannelModel channelModelWithDict:obj];
        [mutable addObject:model];
        
    }];
    
    return mutable.copy;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

@end
