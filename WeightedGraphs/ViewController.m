//
//  ViewController.m
//  WeightedGraphs
//
//  Created by sli19 on 5/2/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import "ViewController.h"
#import "Heap.h"
#import "Graph.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    NSLog(@"Up and running");
    Heap *myHeap = [[Heap alloc] init];
    
    NewNode *n1 = [[NewNode alloc] initWithNumber:@"5"];
    NewNode *n2 = [[NewNode alloc] initWithNumber:@"4"];
    NewNode *n3 = [[NewNode alloc] initWithNumber:@"15"];
    NewNode *n4 = [[NewNode alloc] initWithNumber:@"12"];
    NewNode *n5 = [[NewNode alloc] initWithNumber:@"11"];
    NewNode *n6 = [[NewNode alloc] initWithNumber:@"3"];
    [myHeap add:n1];
    [myHeap add:n2];
    [myHeap add:n3];
    [myHeap add:n4];
    [myHeap add:n5];
    [myHeap add:n6];
    [myHeap remove];
    
    self.graph = [[Graph alloc] init];
    [self buildGraph];
    
    NSLog(@"Finished program");
}

//Worked with Neil, and he helped with syntax from here
-(NSArray *)textToArray{
    NSString *file = [[NSBundle mainBundle] pathForResource:@"usa" ofType:@"txt"];
    NSArray *lines = [[NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil] componentsSeparatedByString:@"\n"];
    
    return lines;
}

-(void)buildGraph{
    
    NSArray *lines = [self textToArray];
    int po = 0;
    
    for(int i = 0; i < 87575; i++){
        NSMutableArray *lineContent = [NSMutableArray arrayWithArray:[lines[i] componentsSeparatedByString:@" "]];
        [lineContent removeObject:@""];
        NewNode *addNode = [[NewNode alloc] initWithNumber:lineContent[0]];
        addNode.x_coordinate = (int)lineContent[1];
        addNode.y_coordinate = (int)lineContent[2];
        po++;
        [self.graph addNode:addNode];
    }
    NSLog(@"printing po %i", po);
    for (int j = 87575; j < [lines count] - 1; j++) {
        NSMutableArray *lineContent = [NSMutableArray arrayWithArray:[lines[j] componentsSeparatedByString:@" "]];
        [lineContent removeObject:@""];
        [self.graph addConnections:lineContent[0] andLocationTwo:lineContent[1]];
    }
}

//to here

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
