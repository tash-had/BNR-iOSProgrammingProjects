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

@end

@implementation BNRItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableViewBackground.jpg"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)init{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self){
        for (int i = 0;i<5;i++){
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}
- (instancetype)initWithStyle:(UITableViewStyle)style{
    return [self init];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *sortedItems = [[BNRItemStore sharedStore] itemsOverUnder50];

    if (section == 0){
        return [[sortedItems objectAtIndex:0] count];
    }else{
        return [[sortedItems objectAtIndex:1] count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return @"Items Over $50";
    }else{
        return @"Items Not Over $50";
    }
}

- (BOOL)isLastRowOfTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    NSInteger row = [indexPath row];
    return [tableView numberOfRowsInSection:1] - 1 == row;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (![self isLastRowOfTableView:tableView indexPath:indexPath])
        return 60.0;
    else
        return 44.0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Create ian instance of UITableViewCell w. default appearance
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
//

    // Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    // Set the text on the cell with the desc. of the item that is at the nth index of items, where n = row this cell will appear in on the table view
    NSArray *sortedItems = [[BNRItemStore sharedStore] itemsOverUnder50];

    if (indexPath.section == 0){
        BNRItem *item = sortedItems[0][indexPath.row];
        cell.textLabel.text = [item description];
    }else{
        BNRItem *item = sortedItems[1][indexPath.row];
        cell.textLabel.text = [item description];
    }
    if (![self isLastRowOfTableView:tableView indexPath:indexPath])
        cell.textLabel.font = [UIFont systemFontOfSize:20.0];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}
@end
