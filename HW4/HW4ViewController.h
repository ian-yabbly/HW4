//
//  HW4ViewController.h
//  HW4
//
//  Created by Ian Shafer on 10/28/13.
//  Copyright (c) 2013 Yabbly. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HW4BubbleAnimator.h"

@interface HW4ViewController : UIViewController

@property (nonatomic, strong) HW4BubbleAnimator *bubbleAnimator;
@property (nonatomic, strong) NSMutableArray *smallBubbleAnimators;

-(void)handleTapGesture:(UITapGestureRecognizer *)recognizer;

@end
