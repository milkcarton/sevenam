//
//  MCBlendController.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 30/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCBlendController.h"

@implementation MCBlendController

#pragma mark Overridden methods

- (id)init {
	self = [super init];
	
	
	
	
	allBlends = [[NSMutableArray array] retain];
	yourBlends = [[NSMutableArray array] retain];
	
	NSMutableDictionary *blendTypesArray = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Blends" ofType:@"plist"]];
	NSEnumerator *blendTypesEnumerator = [blendTypesArray objectEnumerator];
	NSArray *blendTypes;
	while (blendTypes = [blendTypesEnumerator nextObject]) {
		NSEnumerator *blendsEnumerator = [blendTypes objectEnumerator];
		NSDictionary *blendsDictionary;
		while (blendsDictionary = [blendsEnumerator nextObject]) {
			if ([[blendsDictionary objectForKey:@"Selected"] boolValue]) {
				MCBlend *blend = [[MCBlend alloc] init];
				blend.name = (NSString *) [blendsDictionary objectForKey:@"Name"];
				blend.imageName = (NSString *) [blendsDictionary objectForKey:@"Image"];
				blend.strength = (NSNumber *) [blendsDictionary objectForKey:@"Strength"];
				NSMutableArray *types = [NSMutableArray array];
				NSEnumerator *typesEnumarator = [(NSArray *) [blendsDictionary objectForKey:@"Types"] objectEnumerator];
				NSString *typeName;
				while (typeName = [typesEnumarator nextObject]) {
					if ([typeName compare:@"ristretto"] ==NSOrderedSame) {
						[types addObject:[NSNumber numberWithInt:MCSizeRistretto]];
					} else if ([typeName compare:@"espresso"] ==NSOrderedSame) {
						[types addObject:[NSNumber numberWithInt:MCSizeEspresso]];
					} else if ([typeName compare:@"lungo"] ==NSOrderedSame) {
						[types addObject:[NSNumber numberWithInt:MCSizeLungo]];
					} else if ([typeName compare:@"cappuccino"] ==NSOrderedSame) {
						[types addObject:[NSNumber numberWithInt:MCSizeCappuccino]];
					}
				}
				blend.types = types;
				[blends addObject:blend];
			}
		}
	}
	
	
	
	
	
	return self;
}

#pragma mark Personal methods

- (NSArray *)allBlends {
	return allBlends;
}

- (NSArray *)yourBlends {
	return yourBlends;
}

@end
