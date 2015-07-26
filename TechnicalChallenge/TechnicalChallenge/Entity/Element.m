//
//  Element.m
//  TechnicalChallenge
//
//  Created by mts on 26/7/15.
//  Copyright (c) 2015 Wirestorm. All rights reserved.
//

#import "Element.h"

@implementation Element

- (id)init:(NSDictionary *)dic {
    if ( self = [super init] ) {
        
        if(dic != nil){
            
            _name = [dic objectForKey:@"name"];
            _position = [dic objectForKey:@"position"];
            _smallpic = [dic objectForKey:@"smallpic"];
            _lrgpic = [dic objectForKey:@"lrgpic"];
        }
    }
    return self;
}

@end
