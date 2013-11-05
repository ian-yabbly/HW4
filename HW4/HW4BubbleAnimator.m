//
//  HW4BubbleAnimator.m
//  HW4
//
//  Created by Ian Shafer on 10/30/13.
//  Copyright (c) 2013 Yabbly. All rights reserved.
//

#import "HW4BubbleAnimator.h"

@implementation HW4BubbleAnimator

-(instancetype)initWithReferenceView:(UIView *)referenceView
                   andViewsToAnimate:(NSArray *)viewsToAnimate
         withCircleCollisionBoundary:(BOOL)hasCircleCollisionBoundary
{
    self = [super init];
    if (self) {
        _dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:referenceView];
        
        _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:viewsToAnimate];
        if (hasCircleCollisionBoundary) {
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, referenceView.frame.size.width, referenceView.frame.size.height)];
            NSString *pathName = [NSString stringWithFormat:@"CirclePath-%@", referenceView.description];
            [_collisionBehavior addBoundaryWithIdentifier:pathName forPath:path];
        } else {
            _collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
        }
        
        _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:viewsToAnimate];
        _gravityBehavior.magnitude = 0.06f;
        
        [_dynamicAnimator addBehavior:_gravityBehavior];
        [_dynamicAnimator addBehavior:_collisionBehavior];
    }
    return self;
}

-(void)removeAnimatedView:(UIView *)viewToRemove
{
    [_collisionBehavior removeItem:viewToRemove];
    [_gravityBehavior removeItem:viewToRemove];
}

-(void)addViewToAnimate:(UIView *)viewToAnimate
{
    [_collisionBehavior addItem:viewToAnimate];
    [_gravityBehavior addItem:viewToAnimate];
}

-(void)updateView:(UIView *)viewToUpdate
{
    [_dynamicAnimator updateItemUsingCurrentState:viewToUpdate];
}

-(void)logFrame:(CGRect)frame withName:(NSString *)name
{
    NSLog(@"%@", name);
    NSLog(@"x      [%f]", frame.origin.x);
    NSLog(@"y      [%f]", frame.origin.y);
    NSLog(@"width  [%f]", frame.size.width);
    NSLog(@"height [%f]", frame.size.width);
}

@end
