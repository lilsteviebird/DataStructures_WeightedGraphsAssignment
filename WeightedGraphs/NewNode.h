//
//  NewNode.h
//  WeightedGraphs
//
//  Created by sli19 on 5/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#ifndef NewNode_h
#define NewNode_h
@interface NewNode<ObjectType> : NSObject

@property NSString *key; // key
@property float cost;
@property NSMutableArray<NSString *> *connections;
@property int x_coordinate;
@property int y_coordinate;

-(id) initWithNumber: (NSString *) numGiven;
@end

#endif /* NewNode_h */
