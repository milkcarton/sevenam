//
//  MCBlend.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 28/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCBlend.h"

@implementation MCBlend

@synthesize name;
@synthesize imageName;
@synthesize strength;
@synthesize selected;
@synthesize types;

#pragma mark Overridden methods

- (void)dealloc {
	[name release];
	[imageName release];
	[strength release];
	[types release];
	[super dealloc];
}

@end
