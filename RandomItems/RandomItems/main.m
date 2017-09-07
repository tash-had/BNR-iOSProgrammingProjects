//
//  main.m
//  RandomItems
//
//  Created by Tash-had Saqif on 2017-09-02.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
//        // Send the message addObject: to the NSMutable array pointed to by *items, passing a string each time
//        
//        [items addObject:@"One"];
//        [items addObject:@"Two"];
//        [items addObject:@"Three"];
//        
//        //Send another msg to insertObject
//        [items insertObject:@"Zero" atIndex:0];
//        
//        for (NSString *numStr in items){
//            NSLog(@"%@", numStr);
//        }
//        // Destry mutable array obj
//
        
        // POPULATE ARRAY WITH RANDOM ITEMS
//        for (int i = 0; i < 10; i++){
//            [items addObject:[BNRItem randomItem]];
//        }
        
        BNRItem *backpack = [[BNRItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        BNRItem *calculator = [[BNRItem alloc] initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        backpack = nil;
        calculator = nil;
        
        for (BNRItem *item in items){
            NSLog(@"%@", item);
        }

        
        
        // Asking for index out of bounds
//        NSLog(@"%@", items[10]);
        // Exception causing code
//        id lastObj = [items lastObject];
//        [lastObj count];
        NSLog(@"Setting items to nil");
        items = nil;
        
//        BNRItem *item = [[BNRItem alloc] init];
//        
//        item.itemName = @"Red Sofa";
//        item.serialNumber = @"A1B2C";
//        item.valueInDollars = 100;
//        NSLog(@"%@ %@ %@ %d", item.itemName, item.serialNumber, item.dateCreated, item.valueInDollars);
        //updated above code
//        BNRItem *item = [[BNRItem alloc] initWithItemName:@"Red Sofa" serialNumber:@"A1B2C" valueInDollars:100];
//        NSLog(@"%@", item);
//        BNRItem *item2 = [[BNRItem alloc] initWithItemName:@"Blue Sofa"];
//        BNRItem *item3 = [[BNRItem alloc] init];
//        NSLog(@"%@", item2);
//        NSLog(@"%@", item3);
    }
    return 0;
}
