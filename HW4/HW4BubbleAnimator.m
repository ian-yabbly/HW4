//
//  HW4BubbleAnimator.m
//  HW4
//
//  Created by Ian Shafer on 10/30/13.
//  Copyright (c) 2013 Yabbly. All rights reserved.
//

#import "HW4BubbleAnimator.h"

@implementation HW4BubbleAnimator

-(instancetype)initWithReferenceView:(UIView *)referenceView andViewsToAnimate:(NSArray *)viewsToAnimate
{
    self = [super init];
    if (self) {
        _dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:referenceView];

        _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:viewsToAnimate];
        _collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
        [_dynamicAnimator addBehavior:_collisionBehavior];

        _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:viewsToAnimate];
        [_dynamicAnimator addBehavior:_gravityBehavior];
    }
    return self;
}

@end
