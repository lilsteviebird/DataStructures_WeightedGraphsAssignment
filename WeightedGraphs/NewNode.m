//
//  NewNode.m
//  WeightedGraphs
//
//  Created by sli19 on 5/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewNode.h"

@implementation NewNode:NSObject

-(id) initWithNumber: (NSString *) numGiven{
    self = [super init];
    if(self){
        self.key = numGiven;
        self.connections = [NSMutableArray array];
    }
    return self;
}


@end
