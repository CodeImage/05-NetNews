//
//  ChannelModel.h
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject
@property (nonatomic,copy)NSString *tname;
@property (nonatomic,strong)NSNumber *tid;

+ (instancetype)channelModelWithDict:(NSDictionary *)dict;

+ (NSArray *)channelList;
@end
