//
//  MCPickerView.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 25/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCPickerView.h"
#import "MCSizeView.h"
#import "MCStrengthView.h"

@implementation MCPickerView

- (id)initWithFrame:(CGRect)frame {	
    if (self = [super initWithFrame:frame]) {
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 210, 320, 90)];
		label.backgroundColor = [UIColor redColor];
		label.textColor = [UIColor whiteColor];
		label.text = @"Roma";
		label.textAlignment = UITextAlignmentCenter;
		label.font = [UIFont italicSystemFontOfSize:40];
		[self addSubview:label];
		
		MCSizeView *sizeView = [[MCSizeView alloc] initWithFrame:CGRectMake(0, 300, 320, 90)];
		sizeView.backgroundColor = [UIColor redColor];
		[self addSubview:sizeView];
		
		MCStrengthView *strengthView = [[MCStrengthView alloc] initWithFrame:CGRectMake(0, 390, 320, 90)];
		strengthView.strength = 8;
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

@end
