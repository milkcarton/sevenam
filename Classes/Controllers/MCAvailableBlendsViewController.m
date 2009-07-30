//
//  MCAvailableBlendsViewController.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 30/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCAvailableBlendsViewController.h"
#import "MCBlend.h"
#import "MCSizeView.h"

@implementation MCAvailableBlendsViewController

@synthesize blendController;

#pragma mark Overridden methods

- (void)loadView {
	blends = [blendController allBlends];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(completeSelection)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
	[super loadView];
}

- (void)viewDidLoad {
	self.title = @"Your blends";

	UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];
	tableView.delegate = self;
    self.tableView = tableView;
	[tableView release];
	
	[super viewDidLoad];
}

#pragma mark Delegation methods for the UITableViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [blends count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryNone) {
		[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
	} else {
		[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
	}
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	// update the plist
	MCBlend *blend = (MCBlend *) [blends objectAtIndex:indexPath.row];
	[blendController selectBlend:blend];
	blends = [blendController allBlends];
	
	[self.navigationController popViewControllerAnimated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifier = @"BlendCell";
	
	UITableViewCell *blendCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (blendCell == nil) {
		blendCell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:cellIdentifier] autorelease];
	}
	MCBlend *blend = (MCBlend *) [blends objectAtIndex:indexPath.row];
	blendCell.textLabel.text = blend.name;
	blendCell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"patch_%@_small.png", blend.imageName]];
	blendCell.accessoryType = blend.selected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
	
	return blendCell;
}

#pragma mark Personal methods

- (void)completeSelection {
	[blendController refresh];
	[self dismissModalViewControllerAnimated:YES];
}

@end
