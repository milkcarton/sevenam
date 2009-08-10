/*
 Copyright (c) 2009 Jelle Vandebeeck, Simon Schoeters
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 Created by Jelle Vandebeeck on 2009.07.26.
*/

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
