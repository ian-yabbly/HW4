//
//  HW4ViewController.m
//  HW4
//
//  Created by Ian Shafer on 10/28/13.
//  Copyright (c) 2013 Yabbly. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HW4ViewController.h"
#import "UIImage+Bubble.h"
#import "HW4BubbleAnimator.h"

@interface HW4ViewController ()

@end

@implementation HW4ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _bubbleAnimator = [[HW4BubbleAnimator alloc] initWithReferenceView:self.view andViewsToAnimate:@[] withCircleCollisionBoundary:NO];
    //_bubbleAnimator.collisionBehavior.collisionMode = UICollisionBehaviorModeBoundaries;
    _smallBubbleAnimators = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++) {
        [self addTopBubbleWithFrame:CGRectMake(i*80, 0, 80, 80)];
    }
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(handleTopTapGesture:)];
    [self.view addGestureRecognizer:tapRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleTapGesture:(UITapGestureRecognizer *)recognizer
{
    UIView *tappedView = recognizer.view;
    
    [tappedView removeFromSuperview];
    
    for (UIView *view in tappedView.subviews) {
        CGPoint newCenter = CGPointMake(view.center.x + tappedView.frame.origin.x, view.center.y + tappedView.frame.origin.y);
        [view removeFromSuperview];

        // TODO Get rid of this loop
        for (HW4BubbleAnimator *animator in _smallBubbleAnimators) {
            [animator removeAnimatedView:view];
        }

        [_bubbleAnimator removeAnimatedView:tappedView];
        view.center = newCenter;
        [self.view addSubview:view];
        [_bubbleAnimator addViewToAnimate:view];
    }
}

-(void)handleTopTapGesture:(UITapGestureRecognizer *)recognizer
{
    CGPoint center = [recognizer locationInView:self.view];
    [self addTopBubbleWithFrame:CGRectMake(center.x - 40, center.y - 40, 80, 80)];
}

- (UIView *)addTopBubbleWithFrame:(CGRect)frame
{
    CGFloat width = frame.size.width;
    UIImageView *bubbleView = [[UIImageView alloc] initWithImage:[UIImage randomSquareBubbleImageWithWidth:width]];
    [bubbleView setFrame:frame];
    
    bubbleView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(handleTapGesture:)];
    [bubbleView addGestureRecognizer:tapRecognizer];
    
    NSMutableArray *smallBubbleViews = [[NSMutableArray alloc] init];
    for (int j = 0; j < 4; j++) {
        int smallWidth = 12;
        UIImageView *smallBubbleView = [[UIImageView alloc] initWithImage:[UIImage randomSquareBubbleImageWithWidth:smallWidth]];
        [smallBubbleView setFrame:CGRectMake(j*smallWidth+8, 40, smallWidth, smallWidth)];
        [smallBubbleViews addObject:smallBubbleView];
        [bubbleView addSubview:smallBubbleView];
    }
    
    [_smallBubbleAnimators addObject:[[HW4BubbleAnimator alloc] initWithReferenceView:bubbleView
                                                                    andViewsToAnimate:smallBubbleViews
                                                          withCircleCollisionBoundary:YES]];
    
    
    [self.view addSubview:bubbleView];
    [_bubbleAnimator addViewToAnimate:bubbleView];
    
    return bubbleView;
}

@end