//
//  LJNetworkManager.h
//  NetNews
//
//  Created by JackLou on 6/26/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface LJNetworkManager : AFHTTPSessionManager
+ (instancetype)sharedManager;
@end
