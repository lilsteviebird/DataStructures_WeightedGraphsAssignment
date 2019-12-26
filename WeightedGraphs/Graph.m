//
//  Graph.m
//  WeightedGraphs
//
//  Created by sli19 on 5/22/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import "Graph.h"

@implementation Graph

-(id)init{
    self = [super init];
    if(self){
        self.dictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

-(void) addNode:(NewNode*) nodeGiven{
    
    [self.dictionary setObject:nodeGiven forKey:nodeGiven.key];
}
-(void) addConnections: (NSString*) key1 andLocationTwo: (NSString*) key2{
    
    NewNode *node1 = [self.dictionary objectForKey:key1];
    NewNode *node2 = [self.dictionary objectForKey:key2];
    
    [node2.connections addObject:key1];
    [node1.connections addObject:key2];
}
-(NewNode*) getNode: (NSString*) keyGiven{
    return [self.dictionary objectForKey:keyGiven];
}

@end
