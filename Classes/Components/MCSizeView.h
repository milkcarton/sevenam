//
//  MCSizeView.h
//  SevenAm
//
//  Created by Jelle Vandebeeck on 26/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import <UIKit/UIKit.h>

enum {
    MCSizeRistretto = 0,
    MCSizeEspresso = 1,
	MCSizeLungo = 2,
	MCSizeCappuccino = 3
};

@interface MCSizeView : UIView {
	NSArray *sizeTypes;
}

- (void)replaceArrayWithArray:(NSArray *)array;

@end
