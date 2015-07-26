//
//  APIRequest.m
//  TechnicalChallenge
//
//  Created by mts on 26/7/15.
//  Copyright (c) 2015 Wirestorm. All rights reserved.
//

#import "APIRequest.h"
#import "AFNetworking.h"

#define API_URL_BASE @"https://s3-us-west-2.amazonaws.com/wirestorm/"

@implementation APIRequest

+ (instancetype)manager {
    return [[self alloc] init];
}

- (void)requestWithEndpoint:(NSString *)endpoint andWithResponseBlock:(void (^)(NSInteger, NSData *, NSError*))responseBlock{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *urlComplete = [[NSString alloc] initWithFormat:@"%@%@", API_URL_BASE, endpoint];
    
    [manager GET:urlComplete parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        NSLog(@"response: %@", operation.responseString);
        
        responseBlock(operation.response.statusCode, operation.responseData, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        NSLog(@"Error: %@", error);
        
        responseBlock(operation.response.statusCode, operation.responseData, error);
    }];
}

@end