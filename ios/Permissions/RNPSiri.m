//
//  RNPSiri.m
//  ReactNativePermissions
//
//  Created by Timothy Mironenko on 10/4/18.
//  Copyright © 2018 Yonah Forst. All rights reserved.
//

#import "RNPSiri.h"
#import <Foundation/Foundation.h>

@import Intents;

@implementation RNPSiri

+ (NSString *)getStatus
{
    int status = [INPreferences siriAuthorizationStatus];
    
    switch (status) {
        case INSiriAuthorizationStatusAuthorized:
            return RNPStatusAuthorized;
        case INSiriAuthorizationStatusDenied:
            return RNPStatusDenied;
        case INSiriAuthorizationStatusRestricted:
            return RNPStatusRestricted;
        default:
            return RNPStatusUndetermined;
    }
}

+ (void)request:(void (^)(NSString *))completionHandler
{
    void (^handler)(void) =  ^(void) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler([self.class getStatus]);
        });
    };
    
    [INPreferences requestSiriAuthorization:^(INSiriAuthorizationStatus status) {
        handler();
    }];
}

@end
