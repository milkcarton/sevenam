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
		backgroundView = [[MCBackgroundView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
		[backgroundView setName:@"default"];
		[self addSubview:backgroundView];

		blendView = [[MCBlendView alloc] initWithFrame:CGRectMake(0, 0, 320, 210)];
		blendView.backgroundColor = [UIColor clearColor];
		[self addSubview:blendView];

		nameView = [[MCNameView alloc] initWithFrame:CGRectMake(0, 210, 320, 90)];
		nameView.backgroundColor = [UIColor clearColor];
		[nameView setName:@"espresso"];
		[self addSubview:nameView];
		
		sizeView = [[MCSizeView alloc] initWithFrame:CGRectMake(0, 300, 320, 90)];
		sizeView.backgroundColor = [UIColor clearColor];
		[self addSubview:sizeView];

		strengthView = [[MCStrengthView alloc] initWithFrame:CGRectMake(0, 390, 320, 90)];
		strengthView.strength = [NSNumber numberWithInt:5];
		strengthView.circleColor = [UIColor blackColor];
		strengthView.lineColor = [UIColor whiteColor];
		strengthView.backgroundColor = [UIColor clearColor];
		[self addSubview:strengthView];

		infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
        [infoButton setFrame:CGRectMake(280, 20, 20, 20)];
		[infoButton addTarget:delegate action:@selector(loadBlendSelection) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:infoButton];
	}
	return self;
}

#pragma mark Personal methods

- (void)viewsHidden:(BOOL)hide {
	blendView.hidden = hide;
	nameView.hidden = hide;
	sizeView.hidden = hide;
	strengthView.hidden = hide;
	infoButton.hidden = hide;
}

- (void)flipView {
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationTransition: UIViewAnimationTransitionFlipFromLeft forView:[self superview] cache:YES];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:delegate];
	
	[backgroundView setName:blend.imageName];
	[blendView setName:blend.imageName];
	[nameView setName:blend.imageName];
	[sizeView replaceArrayWithArray:blend.types];
	strengthView.strength = blend.strength;
	
	[[self superview] exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
	[UIView commitAnimations];
}

@end
