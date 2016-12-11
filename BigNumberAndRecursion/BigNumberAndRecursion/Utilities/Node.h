//
//  Node.h
//  CodingTest
//
//  Created by Jean-Jean Wei on 2016-11-12.
//  Copyright © 2016 Jean-Jean Wei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
{
    Node *parentNode;
    Node *leftNode;
    Node *rightNode;
    int data;
}

@property (copy) Node *parentNode;
@property (copy) Node *leftNode;
@property (copy) Node *rightNode;
@property (assign) int data;

- (void)assignLeftNode:(Node*)node;
- (void)assignRightNode:(Node*)node;

@end
