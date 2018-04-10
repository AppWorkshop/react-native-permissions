//
//  RNPSiri.h
//  ReactNativePermissions
//
//  Created by Timothy Mironenko on 10/4/18.
//  Copyright © 2018 Yonah Forst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTConvert+RNPStatus.h"

@interface RNPSiri : NSObject

+ (NSString *)getStatus;
+ (void)request:(void (^)(NSString *))completionHandler;

@end
