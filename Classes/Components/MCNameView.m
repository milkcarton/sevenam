//
//  MCNameView.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 26/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCNameView.h"

@implementation MCNameView

@synthesize name;

#pragma mark Overriden methods

- (void)drawRect:(CGRect)rectangle {
	[[UIImage imageNamed:[NSString stringWithFormat:name, @"%@.png"]] 
		drawInRect:CGRectMake(self.bounds.origin.x+20, self.bounds.origin.y+10, self.bounds.size.width-40, self.bounds.size.height-20)];
	
	
	
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	UIColor *backgroundColor = [UIColor grayColor];
	[backgroundColor set];
	CGContextFillRect(context, CGRectMake(self.bounds.origin.x+20, self.bounds.origin.y+10, self.bounds.size.width-40, self.bounds.size.height-20));
}

@end
