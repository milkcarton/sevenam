//
//  MCBlend.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 21/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCBlend.h"

@implementation MCBlend

@synthesize name;

#pragma mark Overridden methods

- (id)init {
	self = [super init];
	name = @"";
	return self;
}

@end
