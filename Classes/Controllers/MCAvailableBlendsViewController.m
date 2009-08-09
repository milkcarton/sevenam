//
//  MCAvailableBlendsViewController.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 30/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCAvailableBlendsViewController.h"
#import "MCBlend.h"
#import "MCBlendType.h"
#import "MCSizeView.h"
#import "MCBackgroundView.h"
#import "MCOverviewBlendViewCell.h"
#import "MCOverviewBlendTypeViewCell.h"

@implementation MCAvailableBlendsViewController

@synthesize blendController;

#pragma mark Overridden methods

- (void)loadView {
	blendTypes = [blendController allBlends];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(completeSelection)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
	self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:.608 green:.608 blue:.608 alpha:1];
	
	[super loadView];
}

- (void)viewDidLoad {
	self.title = @"Your blends";

	UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
	tableView.delegate = self;
	tableView.backgroundColor = [UIColor colorWithRed:.950 green:.950 blue:.950 alpha:1];
	tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.tableView = tableView;
	[tableView release];
	
	[super viewDidLoad];
}

#pragma mark Delegation methods for the UITableViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [blendTypes count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [((MCBlendType *) [blendTypes objectAtIndex:section]).blends count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return ((MCBlendType *) [blendTypes objectAtIndex:section]).name;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 29;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	static NSString *cellIdentifier = @"BlendTypeCell";
	
	MCOverviewBlendTypeViewCell *blendTypeCell = (MCOverviewBlendTypeViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (blendTypeCell == nil) {
		blendTypeCell = [[[MCOverviewBlendTypeViewCell alloc] initWithFrame:CGRectZero] autorelease];
	}
	
	MCBlendType *blendType = (MCBlendType *) [blendTypes objectAtIndex:section];
	[blendTypeCell setBlendType:blendType];
	
	return blendTypeCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	MCBlend *blend = [((MCBlendType *) [blendTypes objectAtIndex:indexPath.section]).blends objectAtIndex:indexPath.row];
	if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryNone) {
		blend.selected = YES;
		[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
	} else {
		blend.selected = NO;
		[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
	}
	[((MCOverviewBlendViewCell *) [tableView cellForRowAtIndexPath:indexPath]) setBlend:blend];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifier = @"BlendCell";
	
	MCOverviewBlendViewCell *blendCell = (MCOverviewBlendViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (blendCell == nil) {
		blendCell = [[[MCOverviewBlendViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:cellIdentifier] autorelease];
	}
	
	MCBlend *blend = [((MCBlendType *) [blendTypes objectAtIndex:indexPath.section]).blends objectAtIndex:indexPath.row];
	blendCell.accessoryType = blend.selected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
	blendCell.selectionStyle = UITableViewCellSelectionStyleGray;
	UIImageView *checkmarkView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
	blendCell.accessoryView = checkmarkView;
	blendCell.editingAccessoryView = checkmarkView;
	[blendCell setBlend:blend];
	
	return blendCell;
}

#pragma mark Personal methods

- (void)completeSelection {
	if (![blendController containsSelectedBlends]) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty selection" message:@"You should select at least one blend!" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
		[alert addButtonWithTitle:@"Try again"];
		[alert show];
		[alert release];
	} else {
		[blendController writeToFile];
		[self dismissModalViewControllerAnimated:YES];
	}
}

@end
