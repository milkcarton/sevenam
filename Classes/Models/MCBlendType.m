//
//  MCBlendType.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 21/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCBlendType.h"

@implementation MCBlendType

@synthesize name;
@synthesize blends;

#pragma mark Overridden methods

- (id)init {
	self = [super init];
	name = @"";
	blends = [NSMutableArray array];
	return self;
}

@end
