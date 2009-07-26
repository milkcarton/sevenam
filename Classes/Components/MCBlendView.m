//
//  MCBlendView.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 26/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCBlendView.h"
#import <QuartzCore/CoreAnimation.h>

@implementation MCBlendView

#pragma mark Overridden methods

- (id)initWithFrame:(CGRect)rectangle {
	if (self = [super initWithFrame:rectangle]) {
		imageView = [[UIImageView alloc] initWithFrame:CGRectMake(85, 50, 150, 150)];
		imageView.image = [UIImage imageNamed:@"ristretto.png"];
		[self addSubview:imageView];
	}
	return self;
}

#pragma mark Personal methods

- (void)setName:(NSString *)name {
	imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", name]];
}

@end
