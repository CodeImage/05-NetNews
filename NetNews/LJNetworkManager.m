//
//  LJNetworkManager.m
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJNetworkManager.h"

@implementation LJNetworkManager
+ (instancetype)sharedManager{
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]initWithBaseURL:[NSURL URLWithString:@"http://c.m.163.com/nc/"] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    });
    return instance;
}
@end
