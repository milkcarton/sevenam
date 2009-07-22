//
//  MCPickerView.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 18/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCPickerView.h"

@implementation MCPickerView

@synthesize controller;

#pragma mark Overridden methods

- (id)initWithFrame:(CGRect)frame {
	
    if (self = [super initWithFrame:frame]) {
		UIButton *blendsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		blendsButton.frame = CGRectMake(20, 390, 280, 50);
		[blendsButton setTitle:@"Select your blends" forState:UIControlStateNormal];
		blendsButton.backgroundColor = [UIColor clearColor];
		[blendsButton addTarget:controller action:@selector(openBlendsView) forControlEvents:UIControlEventTouchDown];
		[self addSubview:blendsButton];
	}
	return self;
	
}

- (void)drawRect:(CGRect)rect {

	
	
}

- (void)dealloc {
	
	[super dealloc];
	
}

@end