//
//  APIService.m
//  TechnicalChallenge
//
//  Created by mts on 26/7/15.
//  Copyright (c) 2015 Wirestorm. All rights reserved.
//

#import "APIService.h"
#import "APIRequest.h"
#import "Element.h"

#define API_ENDPOINT @"assets/response.json"

@implementation APIService

+ (APIService*)sharedInstance
{
    static APIService *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[APIService alloc] init];
    });
    return _sharedInstance;
}

-(void)getDataWithResponseBlock:(void (^)(NSArray*))responseBlock {
    
    [[APIRequest manager] requestWithEndpoint:API_ENDPOINT andWithResponseBlock:^(NSInteger statusCode, NSData *data, NSError *error) {
        
        BOOL success = (statusCode == 200);
        NSMutableArray *resourcesArray = nil;
        
        if (success && data != nil) {
            NSError* jsonError;
            NSDictionary* json = [NSJSONSerialization
                                  JSONObjectWithData:data
                                  options:kNilOptions
                                  error:&jsonError];
            
            if(json != nil){
                resourcesArray = [[NSMutableArray alloc] initWithCapacity:json.count];
                NSEnumerator *enumerator = [json objectEnumerator];
                NSDictionary *dic;
                while (dic = [enumerator nextObject]) {
                    Element *item = [[Element alloc] init:dic];
                    [resourcesArray addObject:item];
                }
            }
        }
        
        responseBlock(resourcesArray);
    }];
}

@end