//
//  UIImage+Bubble.m
//  HW4
//
//  Created by Ian Shafer on 10/30/13.
//  Copyright (c) 2013 Yabbly. All rights reserved.
//

#import "UIImage+Bubble.h"
#include <stdio.h>

#define BUBBLE_IMAGE_COUNT 3

@implementation UIImage (Bubble)

+ (UIImage*)randomSquareBubbleImageWithWidth:(int)width
{
    int n = arc4random() % BUBBLE_IMAGE_COUNT;
    NSString *imageName = [NSString stringWithFormat:@"bubble-%d", n];
    UIImage *image = [UIImage imageNamed:imageName];
    CGSize newSize = CGSizeMake(width, width);
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}

@end
