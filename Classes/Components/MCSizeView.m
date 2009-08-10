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
 
 Created by Jelle Vandebeeck on 2009.07.26.
*/

#import "MCSizeView.h"
#import "MCBlend.h"

@implementation MCSizeView

#pragma mark Overridden methods

- (id)initWithFrame:(CGRect)rectangle {
	self = [super initWithFrame:rectangle];
	sizeTypes =[NSArray array];
	return self;
}

- (void)drawRect:(CGRect)rectangle {	
	int size = 55;
	int x = 20;
	int addToX = 75;
	int y = 17.5;
	
	UIImage *ristrettoImage;
	if ([sizeTypes containsObject:[NSNumber numberWithInt:MCSizeRistretto]]) {
		ristrettoImage = [UIImage imageNamed:@"cup_ristretto_selected.png"];
	} else {
		ristrettoImage = [UIImage imageNamed:@"cup_ristretto.png"];
	}
	[ristrettoImage drawInRect:CGRectMake(x, y, size, size)];
	
	x += addToX;
	
	UIImage *espressoImage;
	if ([sizeTypes containsObject:[NSNumber numberWithInt:MCSizeEspresso]]) {
		espressoImage = [UIImage imageNamed:@"cup_espresso_selected.png"];
	} else {
		espressoImage = [UIImage imageNamed:@"cup_espresso.png"];
	}
	[espressoImage drawInRect:CGRectMake(x, y, size, size)];
	
	x += addToX;
	
	UIImage *lungoImage;
	if ([sizeTypes containsObject:[NSNumber numberWithInt:MCSizeLungo]]) {
		lungoImage = [UIImage imageNamed:@"cup_lungo_selected.png"];
	} else {
		lungoImage = [UIImage imageNamed:@"cup_lungo.png"];
	}
	[lungoImage drawInRect:CGRectMake(x, y, size, size)];
	
	x += addToX;
	
	UIImage *cappechinoImage;
	if ([sizeTypes containsObject:[NSNumber numberWithInt:MCSizeCappuccino]]) {
		cappechinoImage = [UIImage imageNamed:@"cup_cappuccino_selected.png"];
	} else {
		cappechinoImage = [UIImage imageNamed:@"cup_cappuccino.png"];
	}
	[cappechinoImage drawInRect:CGRectMake(x, y, size, size)];
}

#pragma mark Personal methods

- (void)replaceArrayWithArray:(NSArray *)array {
	sizeTypes = [[NSArray arrayWithArray:array] retain];
	[self setNeedsDisplay];
}

@end
