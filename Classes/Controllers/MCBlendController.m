//
//  MCBlendController.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 30/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCBlendController.h"
#import "MCBlend.h"
#import "MCBlendType.h"
#import "MCSizeView.h"

static NSString * filePath() {
	return [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"Blends.plist"]; 
}

@implementation MCBlendController

#pragma mark Overridden methods

- (id)init {
	self = [super init];
	[self initializeLocalFile];
	[self loadFromFile];
	return self;
}

#pragma mark Personal methods

- (void)initializeLocalFile {
	if (![[NSFileManager defaultManager] fileExistsAtPath:filePath()]) { 
		[[NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Blends" ofType:@"plist"]] writeToFile:filePath() atomically:NO];
	}	
}

- (void)loadFromFile {
	allBlends = [[NSMutableArray array] retain];
	yourBlends = [[NSMutableArray array] retain];
	
	NSMutableDictionary *blendTypeDictionary = [NSMutableDictionary dictionaryWithContentsOfFile:filePath()];
	NSArray *blendTypeKeys = [[blendTypeDictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];
	NSEnumerator *blendTypeKeysEnumerator = [blendTypeKeys reverseObjectEnumerator];
	NSString *blendTypeKey;
	while (blendTypeKey = [blendTypeKeysEnumerator nextObject]) {
		MCBlendType *blendType = [[MCBlendType alloc] init];
		blendType.name = blendTypeKey;
		blendType.blends = [NSMutableArray array];
		NSArray *blendsArray = [blendTypeDictionary objectForKey:blendTypeKey];
		NSEnumerator *blendsEnumerator = [blendsArray objectEnumerator];
		NSDictionary *blendsDictionary;
		while (blendsDictionary = [blendsEnumerator nextObject]) {
			MCBlend *blend = [[MCBlend alloc] init];
			blend.name = (NSString *) [blendsDictionary objectForKey:@"Name"];
			blend.imageName = (NSString *) [blendsDictionary objectForKey:@"Image"];
			blend.strength = (NSNumber *) [blendsDictionary objectForKey:@"Strength"];
			blend.types = [NSMutableArray array];
			NSEnumerator *typesEnumarator = [(NSArray *) [blendsDictionary objectForKey:@"Types"] objectEnumerator];
			NSString *typeName;
			while (typeName = [typesEnumarator nextObject]) {
				if ([typeName compare:@"ristretto"] ==NSOrderedSame) {
					[blend.types addObject:[NSNumber numberWithInt:MCSizeRistretto]];
				} else if ([typeName compare:@"espresso"] ==NSOrderedSame) {
					[blend.types addObject:[NSNumber numberWithInt:MCSizeEspresso]];
				} else if ([typeName compare:@"lungo"] ==NSOrderedSame) {
					[blend.types addObject:[NSNumber numberWithInt:MCSizeLungo]];
				} else if ([typeName compare:@"cappuccino"] ==NSOrderedSame) {
					[blend.types addObject:[NSNumber numberWithInt:MCSizeCappuccino]];
				}
			}
			blend.selected = [[blendsDictionary objectForKey:@"Selected"] boolValue];
			[blendType.blends addObject:blend];
			if (blend.selected) {
				[yourBlends addObject:blend];
			}
		}
		[allBlends addObject:blendType];
	}
}

- (NSArray *)allBlends {
	return allBlends;
}

- (NSArray *)yourBlends {
	[yourBlends removeAllObjects];
	
	NSEnumerator *blendTypesEnumerator = [allBlends objectEnumerator];
	MCBlendType *blendType;
	while (blendType = [blendTypesEnumerator nextObject]) {
		NSEnumerator *blendsEnumerator = [blendType.blends objectEnumerator];
		MCBlend *blend;
		while (blend = [blendsEnumerator nextObject]) {
			if (blend.selected) {
				[yourBlends addObject:blend];
			}
		}
	}
	
	return yourBlends;
}

- (BOOL)containsSelectedBlends {
	NSEnumerator *blendTypesEnumerator = [allBlends objectEnumerator];
	MCBlendType *blendType;
	while (blendType = [blendTypesEnumerator nextObject]) {
		NSEnumerator *blendsEnumerator = [blendType.blends objectEnumerator];
		MCBlend *blend;
		while (blend = [blendsEnumerator nextObject]) {
			if (blend.selected) {
				return YES;
			}
		}
	}
	return NO;
}

- (void)writeToFile {
	NSMutableDictionary *rootDictionary = [NSMutableDictionary dictionaryWithContentsOfFile:filePath()];
	NSEnumerator *blendTypesEnumerator = [allBlends objectEnumerator];
	MCBlendType *blendType;
	while (blendType = [blendTypesEnumerator nextObject]) {
		NSMutableArray *blendArray = [NSMutableArray array];
		NSEnumerator *blendsEnumerator = [blendType.blends objectEnumerator];
		MCBlend *blend;
		while (blend = [blendsEnumerator nextObject]) {
			NSMutableDictionary *blendDictionary = [NSMutableDictionary dictionary];
			[blendDictionary setObject:blend.name forKey:@"Name"];
			[blendDictionary setObject:blend.imageName forKey:@"Image"];
			[blendDictionary setObject:blend.strength forKey:@"Strength"];
			[blendDictionary setObject:[NSNumber numberWithBool:blend.selected] forKey:@"Selected"];
			NSMutableArray *typesArray = [NSMutableArray array];
			NSEnumerator *typesEnumarator = [blend.types objectEnumerator];
			NSNumber *type;
			while (type = [typesEnumarator nextObject]) {
				if ([type compare:[NSNumber numberWithInt:MCSizeRistretto]] == NSOrderedSame) {
					[typesArray addObject:@"ristretto"];
				} else if ([type compare:[NSNumber numberWithInt:MCSizeEspresso]] == NSOrderedSame) {
					[typesArray addObject:@"espresso"];
				} else if ([type compare:[NSNumber numberWithInt:MCSizeLungo]] == NSOrderedSame) {
					[typesArray addObject:@"lungo"];
				} else if ([type compare:[NSNumber numberWithInt:MCSizeCappuccino]] == NSOrderedSame) {
					[typesArray addObject:@"cappuccino"];
				}
			}
			[blendDictionary setObject:typesArray forKey:@"Types"];
			[blendArray addObject:blendDictionary];
		}
		[rootDictionary setObject:blendArray forKey:blendType.name];
	}
	[rootDictionary writeToFile:filePath() atomically:NO];
}

@end
