//
//  MCBlendController.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 30/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCBlendController : NSObject {
	NSMutableArray *allBlends;
	NSMutableArray *yourBlends;
}

- (NSArray *)allBlends;
- (NSArray *)yourBlends;

@end
