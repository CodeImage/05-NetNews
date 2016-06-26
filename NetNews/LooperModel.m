//
//  LooperModel.m
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LooperModel.h"
#import <AFNetworking.h>
#import "LJNetworkManager.h"

@implementation LooperModel
+ (instancetype)looperModelWithDict:(NSDictionary *)dict{
    LooperModel *model = [[self alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

+ (void)looperListWithSuccessBlock:(void(^)(NSArray *))successBlock errorBlock:(void(^)())errorBlock{
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    LJNetworkManager *manager = [LJNetworkManager sharedManager];
    
    NSMutableArray *mutableArr = [NSMutableArray array];
    
    
    // @"http://c.m.163.com/nc/ad/headline/0-4.html"已经有了baseURL，所以省略了部分URL
    [manager GET:@"http://c.m.163.com/nc/ad/headline/0-4.html" parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dict = responseObject;
        NSString *rootKey = dict.keyEnumerator.nextObject;
        
        NSArray *tempArr = dict[rootKey];
        
        [tempArr enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            LooperModel *model = [LooperModel looperModelWithDict:obj];
            [mutableArr addObject:model];

        }];
        
        if (successBlock) {
            successBlock(mutableArr.copy);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            if (errorBlock) {
                errorBlock();
            }
        }
    }];

    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
@end
