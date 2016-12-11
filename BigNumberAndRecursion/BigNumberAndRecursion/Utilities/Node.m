//
//  Node.m
//  CodingTest
//
//  Created by Jean-Jean Wei on 2016-11-12.
//  Copyright © 2016 Jean-Jean Wei. All rights reserved.
//

#import "Node.h"

@implementation Node
@synthesize data, leftNode, rightNode;
- (id)init
{
    self = [super init];
    
    if (self)
    {
        data = 0;
        leftNode = nil;
        rightNode = nil;
    }
    
    return self;
}

- (void)assignLeftNode:(Node*)node
{
    leftNode = node;
}
- (void)assignRightNode:(Node*)node
{
    rightNode = node;
}

@end
