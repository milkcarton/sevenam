//
//  MCOverviewBlendViewCell.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 02/08/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCOverviewBlendViewCell.h"

@implementation MCOverviewBlendViewCell

@synthesize blend;

#pragma mark Overriden methods

- (void)drawRect:(CGRect)rectangle {
	CGPoint point = CGPointMake(0, 0);
		
	UIImage *backgroundImage = [UIImage imageNamed:@"select_rowbackground.png"];
	
	// Set background
	if (self.selected) {
		backgroundImage = nil;
	}
	[backgroundImage drawInRect:CGRectMake(0, 0, 320, 45)];

	// Draw title
	[[UIColor grayColor] set];
	point.x += 60;
	point.y += 13;
	[blend.name drawAtPoint:point forWidth:200 withFont:[UIFont boldSystemFontOfSize:15] lineBreakMode:UILineBreakModeTailTruncation];
	
	// Draw blend image
	[[UIImage imageNamed:[NSString stringWithFormat:@"patch_%@_small.png", blend.imageName]] drawInRect:CGRectMake(10, 10, 29, 29)];
	
	UIImageView *checkmarkView = (UIImageView *) self.accessoryView;
	UIImageView *checkmarkEditingView = (UIImageView *) self.editingAccessoryView;
	if (blend.selected) {
		checkmarkEditingView.image = [UIImage imageNamed:@"select_button_selected.png"];
		checkmarkView.image = [UIImage imageNamed:@"select_button_selected.png"];
	} else {
		checkmarkEditingView.image = [UIImage imageNamed:@"select_button.png"];
		checkmarkView.image = [UIImage imageNamed:@"select_button.png"];
	}
}

#pragma mark Personal methods

- (void)setBlend:(MCBlend *)myBlend {
	blend = myBlend;
	[self setNeedsDisplay];
}

@end
