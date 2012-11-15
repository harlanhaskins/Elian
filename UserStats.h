//
//  UserStats.h
//  Elian
//
//  Created by Harlan Haskins on 10/28/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Game, SavedString;

@interface UserStats : NSManagedObject

@property (nonatomic, retain) NSNumber * bestTime;
@property (nonatomic, retain) NSOrderedSet *savedStrings;
@property (nonatomic, retain) NSSet *savedGames;
@end

@interface UserStats (CoreDataGeneratedAccessors)

- (void)insertObject:(SavedString *)value inSavedStringsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromSavedStringsAtIndex:(NSUInteger)idx;
- (void)insertSavedStrings:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeSavedStringsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInSavedStringsAtIndex:(NSUInteger)idx withObject:(SavedString *)value;
- (void)replaceSavedStringsAtIndexes:(NSIndexSet *)indexes withSavedStrings:(NSArray *)values;
- (void)addSavedStringsObject:(SavedString *)value;
- (void)removeSavedStringsObject:(SavedString *)value;
- (void)addSavedStrings:(NSOrderedSet *)values;
- (void)removeSavedStrings:(NSOrderedSet *)values;
- (void)addSavedGamesObject:(Game *)value;
- (void)removeSavedGamesObject:(Game *)value;
- (void)addSavedGames:(NSSet *)values;
- (void)removeSavedGames:(NSSet *)values;

@end
