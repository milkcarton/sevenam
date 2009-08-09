//
//  MCNameView.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 26/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCBackgroundView.h"

@implementation MCBackgroundView

#pragma mark Overriden methods

- (void)drawRect:(CGRect)rectangle {
	if ([name compare:@"default"] == NSOrderedSame) {
		[[UIImage imageNamed:@"Default.png"] drawInRect:CGRectMake(0, 0, 320, 480)];
	} else {
		[[UIImage imageNamed:[NSString stringWithFormat:@"back_%@.png", name]] drawInRect:CGRectMake(0, 0, 320, 480)];
	}
}

#pragma mark Personal methods

- (void)setName:(NSString *)myName {
	name = myName;
	[self setNeedsDisplay]; 
}

@end
