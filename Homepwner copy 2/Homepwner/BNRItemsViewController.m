//
//  ViewController.m
//  Homepwner
//
//  Created by Tash-had Saqif on 2017-09-11.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemsViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;
@end

@implementation BNRItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    // Set up header
    UIView *headerView = self.headerView;
    [self.tableView setTableHeaderView:headerView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)init{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self){
//        for (int i = 0;i<5;i++){
//            [[BNRItemStore sharedStore] createItem];
//        }
    }
    return self;
}
- (instancetype)initWithStyle:(UITableViewStyle)style{
    return [self init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[BNRItemStore sharedStore] allItems] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Create ian instance of UITableViewCell w. default appearance
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
//

    // Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    // Set the text on the cell with the desc. of the item that is at the nth index of items, where n = row this cell will appear in on the table view
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        NSArray *items = [[BNRItemStore sharedStore] allItems];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore] removeItem:item];
        
        // Also remove row from table with animation
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    [[BNRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    NSInteger lastRowIndex = [[BNRItemStore sharedStore] getLastRow];
    NSIndexPath *newDestination = proposedDestinationIndexPath;
    if (sourceIndexPath.row == lastRowIndex){
        newDestination = [NSIndexPath indexPathForRow:lastRowIndex inSection:0];
    }else if (proposedDestinationIndexPath.row == lastRowIndex){
        newDestination = sourceIndexPath;
    }
    return newDestination;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}
- (IBAction)addNewItem:(id)sender{
//    NSInteger lastRow = [self.tableView numberOfRowsInSection:0];
    
    // Add new item to array
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    
    // Figure out where that item is in the array
    NSInteger lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
    NSInteger lastRowFixedOld = [[BNRItemStore sharedStore] getLastRow];
    NSIndexPath *lastRowFixedOldIndexPath = [NSIndexPath indexPathForRow:lastRowFixedOld inSection:0];
    
    NSInteger lastRowFixed = [[[BNRItemStore sharedStore] allItems] count] - 1;
    NSIndexPath *lastRowFixedIndexPath = [NSIndexPath indexPathForRow:lastRowFixed inSection:0];
    [self.tableView moveRowAtIndexPath:lastRowFixedOldIndexPath toIndexPath:lastRowFixedIndexPath];
    [[BNRItemStore sharedStore] changeLastRowToIndex:lastRowFixed];
}
- (IBAction)toggleEditingMode:(id)sender{
    // If you are currently in editing mode..
    if (self.isEditing){
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        
        // Turn off editing mode
        [self setEditing:NO animated:YES];
    }else{
        // Change the text of the button to infornm the user of state
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        
        // Enter editing mode
        [self setEditing:YES animated:YES];
        
    }
    
}
- (UIView *)headerView{
    // If header isn't yet loaded
    if (!_headerView){
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return _headerView;
}
@end
