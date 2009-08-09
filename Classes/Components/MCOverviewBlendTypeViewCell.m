//
//  MCOverviewBlendTypeViewCell.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 02/08/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCOverviewBlendTypeViewCell.h"

@implementation MCOverviewBlendTypeViewCell

@synthesize blendType;

#pragma mark Overriden methods

- (void)drawRect:(CGRect)rectangle {
	CGPoint point = CGPointMake(0, 0);
	
	// Set background
	[[UIImage imageNamed:@"header.png"] drawInRect:CGRectMake(0, -1, 320, 30)];

	// Draw title
	[[UIColor grayColor] set];
	point.x += 10;
	point.y += 6;
	[blendType.name drawAtPoint:point forWidth:230 withFont:[UIFont boldSystemFontOfSize:13] lineBreakMode:UILineBreakModeTailTruncation];
}

#pragma mark Personal methods

- (void)setBlendType:(MCBlendType *)myBlendType {
	blendType = myBlendType;
	[self setNeedsDisplay];
}

@end
