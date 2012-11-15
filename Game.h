//
//  Game.h
//  Elian
//
//  Created by Harlan Haskins on 10/28/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Game : NSManagedObject

@property (nonatomic, retain) NSNumber * correctAnswers;
@property (nonatomic, retain) NSString * gameSize;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSNumber * isElianToEnglish;

@end
