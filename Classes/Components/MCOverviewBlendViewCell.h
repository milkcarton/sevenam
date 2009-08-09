//
//  MCOverviewBlendViewCell.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 02/08/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCBlend.h"

@interface MCOverviewBlendViewCell : UITableViewCell {
	MCBlend *blend;
}

@property (retain) MCBlend *blend;

- (void)setBlend:(MCBlend *)myBlend;

@end
