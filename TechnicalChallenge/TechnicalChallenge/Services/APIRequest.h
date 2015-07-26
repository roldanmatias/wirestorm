//
//  APIRequest.h
//  TechnicalChallenge
//
//  Created by mts on 26/7/15.
//  Copyright (c) 2015 Wirestorm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIRequest : NSObject

+ (instancetype)manager;

-(void)requestWithEndpoint:(NSString *)endpoint andWithResponseBlock:(void (^)(NSInteger, NSData *, NSError*))responseBlock;

@end
