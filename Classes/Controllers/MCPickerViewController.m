//
//  MCPickerViewController.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCPickerViewController.h"
#import "MCBlend.h"

@implementation MCPickerViewController

#pragma mark Overriden methods

- (void)loadView {
	blends = [NSMutableArray array];
	[blends retain];
	
	NSMutableDictionary *blendTypesArray = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Blends" ofType:@"plist"]];
	NSEnumerator *blendTypesEnumerator = [blendTypesArray objectEnumerator];
	NSArray *blendTypes;
	while (blendTypes = [blendTypesEnumerator nextObject]) {
		NSEnumerator *blendsEnumerator = [blendTypes objectEnumerator];
		NSDictionary *blendsDictionary;
		while (blendsDictionary = [blendsEnumerator nextObject]) {
			MCBlend *blend = [[MCBlend alloc] init];
			blend.name = (NSString *) [blendsDictionary objectForKey:@"Name"];
			blend.imageName = (NSString *) [blendsDictionary objectForKey:@"Image"];
			blend.strength = (NSNumber *) [blendsDictionary objectForKey:@"Strength"];
			blend.types = (NSArray *) [blendsDictionary objectForKey:@"Types"];
			[blends addObject:blend];
		}
	}
	
	[super loadView];
	
	pickerView = [[MCPickerView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	pickerView.delegate = self;
	[self setView:pickerView];
}

#pragma mark Delegate methods for MCPickerView

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[self refresh];
}

#pragma mark Personal methods

- (void)refresh {
	
	int number = (random() % [blends count]);
	NSLog(@"random number: %d", number);
	
	MCBlend *blend = (MCBlend *) [blends objectAtIndex:number];
	NSLog(@"name: %@, strength: %@", blend.name, blend.strength);
	
	pickerView.blend = blend;
	[pickerView flipView];
}

@end

