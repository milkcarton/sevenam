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

#import "MCNameView.h"

@implementation MCNameView

#pragma mark Overriden methods

- (void)drawRect:(CGRect)rectangle {
	[[UIImage imageNamed:[NSString stringWithFormat:@"name_%@.png", name]] 
		drawInRect:CGRectMake(self.bounds.origin.x+20, self.bounds.origin.y+10, self.bounds.size.width-40, self.bounds.size.height-20)];
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	UIColor *backgroundColor = [UIColor clearColor];
	[backgroundColor set];
	CGContextFillRect(context, CGRectMake(self.bounds.origin.x+20, self.bounds.origin.y+10, self.bounds.size.width-40, self.bounds.size.height-20));
}

#pragma mark Personal methods

- (void)setName:(NSString *)myName {
	name = myName;
	[self setNeedsDisplay]; 
}

@end
