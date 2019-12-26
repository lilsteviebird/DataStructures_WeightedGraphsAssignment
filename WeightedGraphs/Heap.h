//
//  Heap.h
//  WeightedGraphs
//
//  Created by sli19 on 5/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#ifndef Heap_h
#define Heap_h
#import "NewNode.h"

@interface Heap<ObjectType> : NSObject

@property NSMutableArray<NewNode *> *sortedArray;
@property BOOL isEmpty; 
-(void) add: (NewNode *) nodeToAdd;
-(NewNode *) remove;

@end

#endif /* Heap_h */
