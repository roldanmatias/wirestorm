//
//  Element.h
//  TechnicalChallenge
//
//  Created by mts on 26/7/15.
//  Copyright (c) 2015 Wirestorm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Element : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *position;
@property(nonatomic, strong) NSString *smallpic;
@property(nonatomic, strong) NSString *lrgpic;

- (id)init:(NSDictionary *)dic;

@end
