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
@property (nonatomic) NSUInteger lastRowLastIndex;
@end

@implementation BNRItemStore


+ (instancetype)sharedStore{
    static BNRItemStore *sharedStore = nil;
    
    // Do I need  I need to create a shared store?
    if (!sharedStore){
        sharedStore = [[self alloc] initPrivate];
        [sharedStore.privateItems addObject:@"No More Items!"];
        sharedStore.lastRowLastIndex = 0;
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

- (void)changeLastRowToIndex:(int)newIndex{
    self.lastRowLastIndex = newIndex;
}
- (NSUInteger)getLastRow{
    return self.lastRowLastIndex;
}
- (NSArray *)allItems{
    return self.privateItems;
}
- (BNRItem *)createItem{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

- (void)removeItem:(BNRItem *)item{
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex{
    if (fromIndex == toIndex){
        return;
    }
    // Get pointer to item being moved so you can re-insert it
    BNRItem *item = self.privateItems[fromIndex];
    // Remove item from array
    [self.privateItems removeObjectAtIndex:fromIndex];
    // Insert item in array at new location
    [self.privateItems insertObject:item atIndex:toIndex];
}
@end
