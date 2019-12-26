//
//  Heap.m
//  WeightedGraphs
//
//  Created by sli19 on 5/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Heap.h"
#import "NewNode.h"
@implementation Heap:NSObject

-(id)init{
    self = [super init];
    if(self){
        self.sortedArray = [[NSMutableArray alloc] init];
        NewNode *emptyNode = [[NewNode alloc] init];
        [self.sortedArray addObject:emptyNode];
    }
    return self;
}

-(void) add: (NewNode *) nodeToAdd{
    
    [self.sortedArray addObject:nodeToAdd];
    [self heapify:[self.sortedArray count] - 1];
    
}

-(NewNode *) remove {
    
    NewNode *removed = [self.sortedArray objectAtIndex:1];
    [self.sortedArray replaceObjectAtIndex:1 withObject:[self.sortedArray objectAtIndex:[self.sortedArray count]-1]];
    [self.sortedArray removeObjectAtIndex:[self.sortedArray count]-1];
    
    NSUInteger parentIndex = 1;
    NSUInteger leftChildIndex = 2;
    NSUInteger rightChildIndex = 3;
    
    while (true){
        if (leftChildIndex >= self.sortedArray.count && rightChildIndex >= self.sortedArray.count){
            break;
        } else if (leftChildIndex >= self.sortedArray.count && [self.sortedArray objectAtIndex:rightChildIndex] != NULL){
            // copy the code from right
            [self.sortedArray exchangeObjectAtIndex:parentIndex withObjectAtIndex:rightChildIndex];
            parentIndex = rightChildIndex;
            rightChildIndex = [self rightChildIndex:parentIndex];
            leftChildIndex = [self leftChildIndex:parentIndex];

        } else if ([self.sortedArray objectAtIndex:leftChildIndex] != NULL && rightChildIndex >= self.sortedArray.count) {
            // copy the code from left
            [self.sortedArray exchangeObjectAtIndex:parentIndex withObjectAtIndex:leftChildIndex];
            parentIndex = leftChildIndex;
            rightChildIndex = [self rightChildIndex:parentIndex];
            leftChildIndex = [self leftChildIndex:parentIndex];
            
        } else if ([self.sortedArray objectAtIndex:leftChildIndex] != NULL && [self.sortedArray objectAtIndex:leftChildIndex] != NULL) {
            // right
            if ([self.sortedArray objectAtIndex:rightChildIndex].cost < [self.sortedArray objectAtIndex:leftChildIndex].cost || [self.sortedArray objectAtIndex:rightChildIndex].cost == [self.sortedArray objectAtIndex:leftChildIndex].cost) {
                [self.sortedArray exchangeObjectAtIndex:parentIndex withObjectAtIndex:rightChildIndex];
                parentIndex = rightChildIndex;
                rightChildIndex = [self rightChildIndex:parentIndex];
                leftChildIndex = [self leftChildIndex:parentIndex];
            }
            // left
            else if ([self.sortedArray objectAtIndex:rightChildIndex].cost > [self.sortedArray objectAtIndex:leftChildIndex].cost) {
                [self.sortedArray exchangeObjectAtIndex:parentIndex withObjectAtIndex:leftChildIndex];
                parentIndex = leftChildIndex;
                rightChildIndex = [self rightChildIndex:parentIndex];
                leftChildIndex = [self leftChildIndex:parentIndex];
            }
        }

    }
    
    return removed;
}

-(void) heapify:(NSUInteger)index {
    
    NSUInteger parentIndex = [self parentIndex:index];
    NSUInteger childIndex = index;
    
    while ([self.sortedArray objectAtIndex:parentIndex].cost > [self.sortedArray objectAtIndex:childIndex].cost && parentIndex > 0){
     
        [self.sortedArray exchangeObjectAtIndex: parentIndex withObjectAtIndex:childIndex];
        childIndex = parentIndex;
        parentIndex = [self parentIndex:childIndex];
    }
}

-(NSUInteger)parentIndex:(NSUInteger)childIndex{
    return childIndex / 2;
}

-(NSUInteger)leftChildIndex:(NSUInteger)childIndex{
    return 2 * childIndex;
}

-(NSUInteger)rightChildIndex:(NSUInteger)childIndex{
    return 2 * childIndex + 1;
}

@end
