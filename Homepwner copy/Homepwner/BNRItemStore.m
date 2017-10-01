//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Tash-had Saqif on 2017-09-11.
//  Copyright © 2017 Tash-had Saqif. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation BNRItemStore


+ (instancetype)sharedStore{
    static BNRItemStore *sharedStore = nil;
    
    // Do I need  I need to create a shared store?
    if (!sharedStore){
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

// If someone calls init in BNRItemStore, let them know of their error
- (instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRItem sharedStore]" userInfo:nil];
    return nil;
}
- (instancetype)initPrivate{
    self = [super init];
    
    if (self){
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}
- (NSArray *)allItems{
    return self.privateItems;
}
- (BNRItem *)createItem{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

- (NSArray *)itemsOverUnder50{
    NSMutableArray *under50 = [[NSMutableArray alloc] init];
    NSMutableArray *over50 = [[NSMutableArray alloc] init];
    
    for (BNRItem *item in self.privateItems){
        if (item.valueInDollars > 50){
            [over50 addObject:item];
        }else{
            [under50 addObject:item];
        }
    }
    [under50 addObject:@"No More Items!"];
    return @[[over50 copy], [under50 copy]];
}
@end
