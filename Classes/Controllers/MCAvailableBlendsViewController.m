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

#pragma mark Overridden methods

- (void)loadView {
	blends = [NSMutableArray array];
	[blends retain];
	
	NSMutableDictionary *blendTypesArray = [NSMutableDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Blends" ofType:@"plist"]];
	NSEnumerator *blendTypesEnumerator = [blendTypesArray objectEnumerator];
	NSArray *blendTypes;
	while (blendTypes = [blendTypesEnumerator nextObject]) {
		NSEnumerator *blendsEnumerator = [blendTypes objectEnumerator];
		NSDictionary *blendsDictionary;
		while (blendsDictionary = [blendsEnumerator nextObject]) {
				MCBlend *blend = [[MCBlend alloc] init];
				blend.name = (NSString *) [blendsDictionary objectForKey:@"Name"];
				blend.imageName = (NSString *) [blendsDictionary objectForKey:@"Image"];
				blend.strength = (NSNumber *) [blendsDictionary objectForKey:@"Strength"];
				NSMutableArray *types = [NSMutableArray array];
				NSEnumerator *typesEnumarator = [(NSArray *) [blendsDictionary objectForKey:@"Types"] objectEnumerator];
				NSString *typeName;
				while (typeName = [typesEnumarator nextObject]) {
					if ([typeName compare:@"ristretto"] ==NSOrderedSame) {
						[types addObject:[NSNumber numberWithInt:MCSizeRistretto]];
					} else if ([typeName compare:@"espresso"] ==NSOrderedSame) {
						[types addObject:[NSNumber numberWithInt:MCSizeEspresso]];
					} else if ([typeName compare:@"lungo"] ==NSOrderedSame) {
						[types addObject:[NSNumber numberWithInt:MCSizeLungo]];
					} else if ([typeName compare:@"cappuccino"] ==NSOrderedSame) {
						[types addObject:[NSNumber numberWithInt:MCSizeCappuccino]];
					}
				}
				blend.types = types;
				[blends addObject:blend];
		}
	}
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(completeSelection)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
	[super loadView];
}

- (void)viewDidLoad {
	self.title = @"Your blends";

	UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStyleGrouped];
	tableView.delegate = self;
//	tableView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    self.tableView = tableView;
	[tableView release];
	
	[super viewDidLoad];
}

#pragma mark Delegation methods for the UITableViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [blends count];
}

/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSEnumerator *blendsEnumertor = [[tableView visibleCells] objectEnumerator];
	UITableViewCell *statusCell;
	while ((statusCell = [statusEnumertor nextObject]) != nil) {
		statusCell.accessoryType = UITableViewCellAccessoryNone;
	}
	[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	book.status = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
	[self.navigationController popViewControllerAnimated:YES];
}*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifier = @"LoginCell";
	
	UITableViewCell *loginCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (loginCell == nil) {
		loginCell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:cellIdentifier] autorelease];
	}
	loginCell.textLabel.text = ((MCBlend *) [blends objectAtIndex:indexPath.row]).name;
	
	return loginCell;
}

#pragma mark Personal methods

- (void)completeSelection {
	[self dismissModalViewControllerAnimated:YES];
}

@end
