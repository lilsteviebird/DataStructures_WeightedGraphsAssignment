//
//  Graph.h
//  WeightedGraphs
//
//  Created by sli19 on 5/22/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Heap.h"
@interface Graph : NSObject

@property NSMutableDictionary *dictionary;

-(void) addNode:(NewNode*) nodeGiven;
-(void) addConnections: (NSString*) key1 andLocationTwo: (NSString*) key2;
-(NewNode*) getNode: (NSString*) keyGiven;


@end
