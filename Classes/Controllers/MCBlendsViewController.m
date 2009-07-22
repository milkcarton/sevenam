//
//  MCBlendsViewController.m
//  SevenAm
//
//  Created by Jelle Vandebeeck on 19/07/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCBlendsViewController.h"
#import "MCBlendType.h"
#import "MCBlend.h"

#define statusList [NSArray arrayWithObjects:@"alo", nil]

@implementation MCBlendsViewController

@synthesize window;

#pragma mark Overridden methods

- (id)init {
	self = [super init];
	
	return self;
}

- (void)viewDidLoad {
	self.title = @"Blends Selector";
	
	UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];
	tableView.delegate = self;
	tableView.backgroundColor = [UIColor blackColor];
    self.tableView = tableView;
	[tableView release];
	
	self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonSystemItemDone target:self action:@selector(openPickerView)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Blends" ofType:@"plist"];
	NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:filePath];
	blendsDictionary = [NSMutableDictionary dictionary];
	int index = 0;
	for (NSString *key in dictionary) {
		MCBlendType *blendType = [[MCBlendType alloc] init];
		blendType.name = key;
		NSString *blendName;
		NSEnumerator *blendsEnumerator = [[dictionary objectForKey:key] objectEnumerator];
		while (blendName = [blendsEnumerator nextObject]) {
			MCBlend *blend = [[MCBlend alloc] init];
			blend.name = blendName;
			[blendType.blends addObject:blend];
		}
		[blendsDictionary setObject:blendType forKey:[NSNumber numberWithInt:index]];
		index++;
	}
	
	[super viewDidLoad];
}

#pragma mark Button evens

- (void)openPickerView {
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.window cache:YES];
	[UIView setAnimationDuration:1.0];
	[self dismissModalViewControllerAnimated:YES];
	[UIView commitAnimations];
	
}

#pragma mark Delegation methods for the UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [blendsDictionary count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	MCBlendType *blendType = [blendsDictionary objectForKey:[NSNumber numberWithInt:section]];
	return [blendType.blends count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return ((MCBlendType *) [blendsDictionary objectForKey:[NSNumber numberWithInt:section]]).name;
}

#pragma mark Delegation methods for the UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSEnumerator *statusEnumertor = [[tableView visibleCells] objectEnumerator];
	UITableViewCell *statusCell;
	while ((statusCell = [statusEnumertor nextObject]) != nil) {
		statusCell.accessoryType = UITableViewCellAccessoryNone;
	}
	[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifier = @"StatusCell";
	
	UITableViewCell *statusCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (statusCell == nil) {
		statusCell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:cellIdentifier] autorelease];
	}
	//statusCell.textLabel.text = [statusList objectAtIndex:indexPath.row];
	/*if ([statusCell.textLabel.text compare:book.status] == NSOrderedSame) {
		statusCell.accessoryType = UITableViewCellAccessoryCheckmark;
	} else {
		statusCell.accessoryType = UITableViewCellSelectionStyleNone;
	}*/
	
	//statusCell.textLabel.text = [statusList objectAtIndex:indexPath.row];
	statusCell.selected = NO;
	
	return statusCell;
}

@end
