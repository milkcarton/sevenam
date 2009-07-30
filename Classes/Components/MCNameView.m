//
//  MCNameView.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 26/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCNameView.h"

@implementation MCNameView

#pragma mark Overriden methods

- (void)drawRect:(CGRect)rectangle {
	[[UIImage imageNamed:[NSString stringWithFormat:@"name_%@.png", name]] 
		drawInRect:CGRectMake(self.bounds.origin.x+20, self.bounds.origin.y+10, self.bounds.size.width-40, self.bounds.size.height-20)];
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	UIColor *backgroundColor = [UIColor clearColor];
	[backgroundColor set];
	CGContextFillRect(context, CGRectMake(self.bounds.origin.x+20, self.bounds.origin.y+10, self.bounds.size.width-40, self.bounds.size.height-20));
}

#pragma mark Personal methods

- (void)setName:(NSString *)myName {
	name = myName;
	[self setNeedsDisplay]; 
}

@end
