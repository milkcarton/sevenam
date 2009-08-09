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

static UIColor *inactiveColor = nil;

+ (void)initialize {
	if (self == [MCStrengthView class]) {
		inactiveColor = [[UIColor colorWithWhite:255 alpha:0.5] retain];
	}
}

#pragma mark Overriden methods

- (void)drawRect:(CGRect)rectangle {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetAllowsAntialiasing(context, true);
	CGContextSetShouldAntialias(context, true);
	
	int x = 20;
	int addedToX = 14;
	int y = 40;
	int addedToY = 3;
	int size = 10;
	for (int i = 0; i < 10; i++) {
		CGContextSetLineWidth(context, 2.0);
		if ([[NSNumber numberWithInt:i] compare:strength] == NSOrderedAscending) {
			[lineColor set];
			CGContextStrokeEllipseInRect(context, CGRectMake(x, y-addedToY, size, size));
			CGContextFillEllipseInRect(context, CGRectMake(x+4, y+4-addedToY, size-8, size-8));
		} else {
			[inactiveColor set];
			CGContextStrokeEllipseInRect(context, CGRectMake(x, y-addedToY, size, size));
		}
		x += addedToX;
		addedToX += 3;
		addedToY += 1.9;
		size += 3;
	}	
}

#pragma mark Personal methods

- (void)setStrength:(NSNumber *)number {
	strength = number;
	[self setNeedsDisplay];
}

@end
