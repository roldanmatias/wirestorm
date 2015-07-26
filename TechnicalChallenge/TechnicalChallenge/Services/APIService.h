//
//  APIService.h
//  TechnicalChallenge
//
//  Created by mts on 26/7/15.
//  Copyright (c) 2015 Wirestorm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIService : NSObject

+ (APIService*)sharedInstance;

- (void)getDataWithResponseBlock:(void (^)(NSArray*))responseBlock;

@end
