//
//  MCBlendController.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 30/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCBlend.h"

@interface MCBlendController : NSObject {
	NSMutableArray *allBlends;
	NSMutableArray *yourBlends;
}

- (void) refresh;
- (NSArray *) allBlends;
- (NSArray *) yourBlends;

- (void) selectBlend:(MCBlend *) blend;
- (void) unselectBlend:(MCBlend *) blend;
- (void) updateBlendSelection:(BOOL)selected blend:(MCBlend *)blend;

@end
