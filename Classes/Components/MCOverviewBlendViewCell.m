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
 
 Created by Jelle Vandebeeck on 2009.08.02.
*/

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
