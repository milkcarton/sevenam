//
//  MCOverviewBlendTypeViewCell.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 02/08/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCBlendType.h"

@interface MCOverviewBlendTypeViewCell : UIView {
	MCBlendType *blendType;
}

@property (retain) MCBlendType *blendType;

- (void)setBlendType:(MCBlendType *)myBlendType;

@end
