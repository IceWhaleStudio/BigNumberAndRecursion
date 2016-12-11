//
//  ViewController.m
//  BigNumberAndRecursion
//
//  Created by Jean-Jean Wei on 2016-12-11.
//  Copyright © 2016 Jean-Jean Wei. All rights reserved.
//

#import "ViewController.h"
#import "JKBigDecimal.h"
#import "Node.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // test output Fibonacci Numbers f(0) to f(9)
    for (int i = 0; i < 10; i++)
    {
        JKBigInteger *result1 = [self recersiveFibonacci:i];
        NSLog (@"Recursion:  When n = %d -> F(n) =  %@", i, result1);
    
        JKBigInteger *result = [self getFuntionOfN:i];
        NSLog (@"Array:  When n = %d -> F(n) =  %@", i, result);
    }
    
    // test BigNumer output:
    //    JKBigInteger *r1 = [self recersiveFibonacci:9025]; // <-- the recursive function will take forever to get the result
    //    NSLog (@"When n = %d -> F(n) =  %@", 9025, r1);
    JKBigInteger *result = [self getFuntionOfN:9025];
    NSLog (@"When n = %d -> F(n) =  %@", 9025, result);
    
    // test Hexanacci Number H(0) to H(14) (ex. 6 faces dice puzzle)
    for (int i=0; i<15; i++)
    {
        JKBigInteger *num = [self calculateNumOfProbality:0 andSum:i];
        NSLog (@"When n = %d -> H(n) =  %@", i, num);
    }
    
    for (int i=0; i<15; i++)
    {
        JKBigInteger *num = [self getFuntionOfHNByArray:i];
        NSLog (@"When n = %d -> H(n) =  %@", i, num);
    }
    JKBigInteger *n720 = [self getFuntionOfHNByArray:720];
    NSLog (@"When n = %d -> result of how many possible ways =  %@", 720, n720);
    
    //    JKBigInteger *n610 = [self calculateNumOfProbality:0 andSum:610]; <-- the recursive function will take forever to get the result
    //    NSLog (@"When n = %d -> result of how many possible ways =  %@", 610, n610);
    
    /* Binary Tree Levels of Traveling */
    // contstruct the binary tree with the following data
    //          1
    //       /     \
    //      2       3
    //     / \     / \
    //    4   5   6   7
    //   / \ / \ / \ / \
    //  8               9
    Node *root = [Node new];
    root.data = 1;
    
    Node *newNode = [Node new];
    newNode.data =2;
    [root assignLeftNode:newNode];
    newNode = [Node new];
    newNode.data =3;
    [root assignRightNode:newNode];
    
    newNode = [Node new];
    newNode.data =4;
    [root.leftNode assignLeftNode:newNode];
    
    newNode = [Node new];
    newNode.data =5;
    [root.leftNode assignRightNode:newNode];
    
    newNode = [Node new];
    newNode.data =6;
    [root.rightNode assignLeftNode:newNode];
    
    newNode = [Node new];
    newNode.data =7;
    [root.rightNode assignRightNode:newNode];
    
    newNode = [Node new];
    newNode.data =8;
    [root.leftNode.leftNode assignLeftNode:newNode];
    
    newNode = [Node new];
    newNode.data =9;
    [root.rightNode.rightNode assignRightNode:newNode];
    
    [self printNodesBySameDepth:root];
    
}

// Use Recursion to solve the Fibonacci Numbers
- (JKBigInteger*) recersiveFibonacci:(int)n
{
    if (n == 0)
    {
        return [[JKBigInteger alloc] initWithString:@"0"];
    }
    if (n == 1)
    {
        return [[JKBigInteger alloc] initWithString:@"1"];
    }
    else
    {
        return [[self recersiveFibonacci:n-1] add: [self recersiveFibonacci:n-2]];
    }
}
// Use Array to solve Fibonacci Numbers
- (JKBigInteger*) getFuntionOfN:(int)inputNum
{
    JKBigInteger *result;
    
    NSMutableArray *fOfNArray = [[NSMutableArray alloc] initWithCapacity:inputNum + 1];
    [fOfNArray insertObject:[[JKBigInteger alloc] initWithUnsignedLong:0] atIndex:0];
    [fOfNArray insertObject:[[JKBigInteger alloc] initWithUnsignedLong:1] atIndex:1];
    
    if (inputNum > 1)
    {
        for (int i = 2; i <= inputNum; i++)
        {
            JKBigInteger *prev1BigInt = [fOfNArray objectAtIndex:i-1];
            JKBigInteger *prev2BigInt = [fOfNArray objectAtIndex:i-2];
            [fOfNArray insertObject:[prev1BigInt add:prev2BigInt] atIndex:i];
        }
    }
    
    result = [fOfNArray objectAtIndex:inputNum];
    
    return result;
}

// Use Recursion to solve the Hexanacci Number (ex. 6 faces dice puzzle)
- (JKBigInteger*) calculateNumOfProbality:(int)current andSum:(int)sum
{
    JKBigInteger *result = [[JKBigInteger alloc] initWithString:@"0"];
    for (int i=1; i<=6; i++)
        {
        if (current == sum)
            {
            JKBigInteger *int1 = [[JKBigInteger alloc] initWithString:@"1"];
            return [result add:int1];
            }
        else if (current > sum)
            {
            return result;
            }
        else
            {
            JKBigInteger *numbers = [self calculateNumOfProbality:current+i andSum:sum];
            result = [result add:numbers];
            }
        }
    return result;
}

// use Array and loop to solve Hexanacci Number (ex. 6 faces dice puzzle)
- (JKBigInteger*) getFuntionOfHNByArray:(int)inputNum
{
    if (inputNum == 0)
        return [[JKBigInteger alloc] initWithUnsignedLong:0];
    
    JKBigInteger *result;
    
    NSMutableArray *fOfNArray = [[NSMutableArray alloc] initWithCapacity:inputNum +2];
    [fOfNArray insertObject:[[JKBigInteger alloc] initWithUnsignedLong:0] atIndex:0];
    [fOfNArray insertObject:[[JKBigInteger alloc] initWithUnsignedLong:1] atIndex:1];
    [fOfNArray insertObject:[[JKBigInteger alloc] initWithUnsignedLong:1] atIndex:2];
    [fOfNArray insertObject:[[JKBigInteger alloc] initWithUnsignedLong:2] atIndex:3];
    [fOfNArray insertObject:[[JKBigInteger alloc] initWithUnsignedLong:4] atIndex:4];
    [fOfNArray insertObject:[[JKBigInteger alloc] initWithUnsignedLong:8] atIndex:5];
    [fOfNArray insertObject:[[JKBigInteger alloc] initWithUnsignedLong:16] atIndex:6];
    if (inputNum > 5)
    {
        for (int i = 6; i <= inputNum + 1; i++)
        {
            JKBigInteger *prev1BigInt = [fOfNArray objectAtIndex:i-1];
            JKBigInteger *prev2BigInt = [fOfNArray objectAtIndex:i-2];
            JKBigInteger *prev3BigInt = [fOfNArray objectAtIndex:i-3];
            JKBigInteger *prev4BigInt = [fOfNArray objectAtIndex:i-4];
            JKBigInteger *prev5BigInt = [fOfNArray objectAtIndex:i-5];
            JKBigInteger *prev6BigInt = [fOfNArray objectAtIndex:i-6];
            JKBigInteger *resultNum = [[[[[prev1BigInt add:prev2BigInt] add:prev3BigInt] add:prev4BigInt] add:prev5BigInt] add:prev6BigInt];
            [fOfNArray insertObject:resultNum atIndex:i];
        }
    }
    
    result = [fOfNArray objectAtIndex:inputNum+1];
    
    return result;
}

// Binary tree and node list
- (void) printNodesBySameDepth:(Node*)rootNode
{
    int height = [self getTreeHeight:rootNode];
    for(int i=1; i<=height; i++)
    {
        printf("\nDepth %d -> ", i);
        [self printNode:rootNode withGivenDepth:i];
    }
    printf("\n");
}

- (void) printNode:(Node*)rootNode withGivenDepth:(int)depth
{
    if (rootNode == nil)
    {
        printf(" ,");
    }
    else if (depth == 1)
    {
        printf(" %d,", rootNode.data);
    }
    else if (depth > 1)
    {
        [self printNode:rootNode.leftNode withGivenDepth:depth-1];
        [self printNode:rootNode.rightNode withGivenDepth:depth-1];
    }
}

- (int) getTreeHeight:(Node*)rootNode
{
    int height = 0;
    if (rootNode != nil)
    {
        int leftNodeHeight = [self getTreeHeight:rootNode.leftNode];
        int rightNodeHeight = [self getTreeHeight:rootNode.rightNode];
        height = leftNodeHeight > rightNodeHeight ? leftNodeHeight + 1 : rightNodeHeight + 1;
    }
    return height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
