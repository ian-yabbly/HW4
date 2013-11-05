//
//  HW4BubbleAnimator.h
//  HW4
//
//  Created by Ian Shafer on 10/30/13.
//  Copyright (c) 2013 Yabbly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HW4BubbleAnimator : NSObject

@property (nonatomic, strong) NSArray *viewsToAnimate;
@property (nonatomic, strong) UIDynamicAnimator *dynamicAnimator;
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;

-(instancetype)initWithReferenceView:(UIView *)referenceView
                   andViewsToAnimate:(NSArray *)viewsToAnimate
         withCircleCollisionBoundary:(BOOL)hasCircleCollisionBoundary;

-(void)removeAnimatedView:(UIView *)viewToRemove;

-(void)addViewToAnimate:(UIView *)viewToAnimate;

-(void)updateView:(UIView *)viewToUpdate;

@end
