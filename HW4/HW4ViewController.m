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
	// Do any additional setup after loading the view, typically from a nib.
    
    _smallBubbleAnimators = [[NSMutableArray alloc] init];
    NSMutableArray *bubbleViews = [[NSMutableArray alloc] init];
    for (int j = 0; j < 4; j++) {
        int width = 80;
        UIImageView *bubbleView = [[UIImageView alloc] initWithImage:[UIImage randomSquareBubbleImageWithWidth:width]];
        [bubbleView setFrame:CGRectMake(j*width, 0, width, width)];
        
        NSMutableArray *smallBubbleViews = [[NSMutableArray alloc] init];
        for (int k = 0; k < 4; k++) {
            int smallWidth = 20;
            UIImageView *smallBubbleView = [[UIImageView alloc] initWithImage:[UIImage randomSquareBubbleImageWithWidth:smallWidth]];
            [smallBubbleView setFrame:CGRectMake(k*smallWidth, 0, smallWidth, smallWidth)];
            [smallBubbleViews addObject:smallBubbleView];
            [bubbleView addSubview:smallBubbleView];
        }
        [_smallBubbleAnimators addObject:[[HW4BubbleAnimator alloc] initWithReferenceView:bubbleView andViewsToAnimate:smallBubbleViews]];
        [bubbleViews addObject:bubbleView];
        [[self view] addSubview:bubbleView];
    }
    
    _bubbleAnimator = [[HW4BubbleAnimator alloc] initWithReferenceView:self.view andViewsToAnimate:bubbleViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
