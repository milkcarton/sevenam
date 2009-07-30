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
@synthesize blend;

#pragma mark Overriden methods

- (id)initWithFrame:(CGRect)frame {	
    if (self = [super initWithFrame:frame]) {
		blendView = [[MCBlendView alloc] initWithFrame:CGRectMake(0, 0, 320, 210)];
		blendView.backgroundColor = [UIColor blackColor];
		[self addSubview:blendView];
		
		nameView = [[MCNameView alloc] initWithFrame:CGRectMake(0, 210, 320, 90)];
		nameView.backgroundColor = [UIColor blackColor];
		[nameView setName:@"espresso"];
		[self addSubview:nameView];
		
		sizeView = [[MCSizeView alloc] initWithFrame:CGRectMake(0, 300, 320, 90)];
		sizeView.backgroundColor = [UIColor blackColor];
		[self addSubview:sizeView];
		
		strengthView = [[MCStrengthView alloc] initWithFrame:CGRectMake(0, 390, 320, 90)];
		strengthView.strength = [NSNumber numberWithInt:5];
		strengthView.circleColor = [UIColor blackColor];
		strengthView.lineColor = [UIColor whiteColor];
		strengthView.backgroundColor = [UIColor blackColor];
		[self addSubview:strengthView];
		
		UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
        [infoButton setFrame:CGRectMake(20, 20, 20, 20)];
		[infoButton addTarget:delegate action:@selector(loadInfo) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:infoButton];
		
	}
	return self;
}

- (void)drawRect:(CGRect)rectangle {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	UIColor *backgroundColor = [UIColor whiteColor];
	
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
	[UIView setAnimationDelegate:delegate];
	
	[blendView setName:blend.imageName];
	[nameView setName:blend.imageName];
	[sizeView replaceArrayWithArray:blend.types];
	strengthView.strength = blend.strength;
	
	[[self superview] exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
	[UIView commitAnimations];
}

@end
