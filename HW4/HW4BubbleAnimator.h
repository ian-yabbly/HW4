//
//  HW4BubbleAnimator.h
//  HW4
//
//  Created by Ian Shafer on 10/30/13.
//  Copyright (c) 2013 Yabbly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HW4BubbleAnimator : NSObject

@property (nonatomic) NSArray *viewsToAnimate;
@property (nonatomic) UIDynamicAnimator *dynamicAnimator;
@property (nonatomic) UICollisionBehavior *collisionBehavior;
@property (nonatomic) UIGravityBehavior *gravityBehavior;

-(instancetype)initWithReferenceView:(UIView *)referenceView andViewsToAnimate:(NSArray *)viewsToAnimate;

@end
