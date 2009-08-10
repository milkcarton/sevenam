/*
 Copyright (c) 2009 Jelle Vandebeeck, Simon Schoeters
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 Created by Jelle Vandebeeck on 2009.07.25.
*/

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
