//
//  Game.h
//  Elian
//
//  Created by Harlan Haskins on 10/28/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class UserStats;

@interface Game : NSManagedObject

@property (nonatomic, retain) NSNumber * correctAnswers;
@property (nonatomic, retain) NSNumber * gameSize;
@property (nonatomic, retain) NSNumber * time;
@property (nonatomic) BOOL isElianToEnglish;
@property (nonatomic, retain) UserStats *userStats;

@end
