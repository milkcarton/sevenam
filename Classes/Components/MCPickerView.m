//
//  MCPickerView.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCPickerView.h"

@implementation MCPickerView

@synthesize delegate;
@synthesize strength;
@synthesize name;

#pragma mark Overriden methods

- (id)initWithFrame:(CGRect)frame {	
    if (self = [super initWithFrame:frame]) {
		blendView = [[MCBlendView alloc] initWithFrame:CGRectMake(0, 0, 320, 210)];
		blendView.backgroundColor = [UIColor redColor];
		[self addSubview:blendView];
		
		nameView = [[MCNameView alloc] initWithFrame:CGRectMake(0, 210, 320, 90)];
		nameView.backgroundColor = [UIColor redColor];
		[nameView setName:@"espresso"];
		[self addSubview:nameView];
		
		sizeView = [[MCSizeView alloc] initWithFrame:CGRectMake(0, 300, 320, 90)];
		sizeView.backgroundColor = [UIColor redColor];
		[self addSubview:sizeView];
		
		strengthView = [[MCStrengthView alloc] initWithFrame:CGRectMake(0, 390, 320, 90)];
		strengthView.strength = 5;
		strengthView.circleColor = [UIColor redColor];
		strengthView.lineColor = [UIColor whiteColor];
		strengthView.backgroundColor = [UIColor redColor];
		[self addSubview:strengthView];
	}
	return self;
}

- (void)drawRect:(CGRect)rectangle {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	UIColor *backgroundColor = [UIColor redColor];
	
	[backgroundColor set];
	CGContextFillRect(context, rectangle);
}

#pragma mark Personal methods

- (void)flipView {
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView:[self superview] cache:YES];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:1.0];
	
	[blendView setName:@"cosi"];
	[nameView setName:@"roma"];
	[sizeView replaceArrayWithArray:sizeTypes];
	strengthView.strength = strength;
	
	[[self superview] exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
	[UIView commitAnimations];
}

- (void)resetTypes {
	[sizeTypes removeAllObjects];
}

- (void)addType:(int)type {
	[sizeTypes addObject:[NSNumber numberWithInt:type]];
}

@end
