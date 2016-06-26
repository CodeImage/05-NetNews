//
//  NewsModel.m
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "NewsModel.h"
#import "LJNetworkManager.h"

@implementation NewsModel
+ (instancetype)newsModelWithDict:(NSDictionary *)dict{
    NewsModel *model = [[self alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

// http://c.m.163.com/nc/article/list/T1348648517839/0-20.html
+ (void)newsListWithSuccessBlock:(void(^)(NSArray *))successBlock errorBlock:(void (^)())errorBlock{
    
    
    LJNetworkManager *manager = [LJNetworkManager sharedManager];
    
    [manager GET:@"article/list/T1348648517839/0-20.html" parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray *mutableArr = [NSMutableArray array];
        
        NSDictionary *dict = responseObject;
        
        NSString *rootKey = dict.keyEnumerator.nextObject;
        
        NSArray *tempArr = dict[rootKey];
        
        [tempArr enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NewsModel *model = [NewsModel newsModelWithDict:obj];
            [mutableArr addObject:model];
            
        }];
        
        if (successBlock) {
            successBlock(mutableArr.copy);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock) {
            errorBlock();
        }
    }];
    
}
@end
