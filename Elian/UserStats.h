//
//  UserStats.h
//  Elian
//
//  Created by Harlan Haskins on 8/19/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

@class SavedString;

@interface UserStats : NSManagedObject

@property (nonatomic, retain) NSString * bestTime;
@property (nonatomic, retain) NSOrderedSet *savedString;
@end

@interface UserStats (CoreDataGeneratedAccessors)

- (void)insertObject:(SavedString *)value inSavedStringAtIndex:(NSUInteger)idx;
- (void)removeObjectFromSavedStringAtIndex:(NSUInteger)idx;
- (void)insertSavedString:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeSavedStringAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInSavedStringAtIndex:(NSUInteger)idx withObject:(SavedString *)value;
- (void)replaceSavedStringAtIndexes:(NSIndexSet *)indexes withSavedString:(NSArray *)values;
- (void)addSavedStringObject:(SavedString *)value;
- (void)removeSavedStringObject:(SavedString *)value;
- (void)addSavedString:(NSOrderedSet *)values;
- (void)removeSavedString:(NSOrderedSet *)values;
@end
