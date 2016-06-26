//
//  NewsModel.h
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
@property (nonatomic,copy) NSString *imgsrc;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *digest;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,strong) NSNumber *replyCount;

@property (nonatomic,strong) NSNumber *imgType;
@property (nonatomic,strong) NSArray *imgextra;

+ (instancetype)newsModelWithDict:(NSDictionary *)dict;

+ (void)newsListWithSuccessBlock:(void(^)(NSArray *))successBlock errorBlock:(void(^)())errorBlock;
@end
