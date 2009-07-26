//
//  MCPickerView.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCPickerView.h"

@implementation MCPickerView

- (void)drawRect:(CGRect)rectangle {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	UIColor *backgroundColor = [UIColor redColor];
	
	[backgroundColor set];
	CGContextFillRect(context, rectangle);
	
	int x = 20;
	int size = 10;
	for (int i = 0; i < 10; i++) {
		[[UIColor whiteColor] set];
		CGContextFillEllipseInRect(context, CGRectMake(x, 410, size, size));
		[[UIColor redColor] set];
		CGContextFillEllipseInRect(context, CGRectMake(x+2, 412, size-4, size-4));
		[[UIColor whiteColor] set];
		CGContextFillEllipseInRect(context, CGRectMake(x+4, 414, size-8, size-8));
		x += 30;
		size +=2;
	}	
}

- (void)dealloc {
	[super dealloc];	
}

@end
