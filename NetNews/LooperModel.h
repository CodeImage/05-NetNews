//
//  LooperModel.h
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LooperModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *imgsrc;

+ (instancetype)looperModelWithDict:(NSDictionary *)dict;

// 异步下载，不能直接用返回值，需要用block传值
//+ (NSArray *)looperList;

+ (void)looperListWithSuccessBlock:(void(^)(NSArray *))successBlock errorBlock:(void(^)())errorBlock;
@end
