//
//  MCStrengthView.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 26/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCStrengthView.h"

@implementation MCStrengthView

@synthesize strength;
@synthesize circleColor;
@synthesize lineColor;

#pragma mark Overriden methods

- (void)drawRect:(CGRect)rectangle {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	int x = 20;
	int addedToX = 14;
	int y = 40;
	int addedToY = 3;
	int size = 10;
	for (int i = 0; i < 10; i++) {
		[lineColor set];
		CGContextFillEllipseInRect(context, CGRectMake(x, y-addedToY, size, size));
		[circleColor set];
		CGContextFillEllipseInRect(context, CGRectMake(x+2, y+2-addedToY, size-4, size-4));
		[lineColor set];
		NSLog(@"strengthComparater: %@ < %@", [NSNumber numberWithInt:i], strength);
		if ([[NSNumber numberWithInt:i] compare:strength] == NSOrderedAscending) {
			CGContextFillEllipseInRect(context, CGRectMake(x+4, y+4-addedToY, size-8, size-8));
		}
		x += addedToX;
		addedToX += 3;
		addedToY += 1.9;
		size +=3;
	}	
}

#pragma mark Personal methods

- (void)setStrength:(NSNumber *)number {
	strength = number;
	[self setNeedsDisplay];
}

@end
