//
//  MCSizeView.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 26/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

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
