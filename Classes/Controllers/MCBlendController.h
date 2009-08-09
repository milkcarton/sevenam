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

- (void)initializeLocalFile;
- (void)loadFromFile;
- (NSArray *)allBlends;
- (NSArray *)yourBlends;
- (BOOL)containsSelectedBlends;
- (void)writeToFile;

@end
