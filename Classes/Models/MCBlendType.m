//
//  MCBlendType.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 01/08/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCBlendType.h"

@implementation MCBlendType

@synthesize name;
@synthesize blends;

#pragma mark Overridden methods

- (void)dealloc {
	[name release];
	[blends release];
	[super dealloc];
}

@end
