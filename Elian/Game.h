//
//  Game.h
//  Elian
//
//  Created by Harlan Haskins on 10/28/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Game : NSObject

@property (nonatomic) NSInteger correctAnswers;
@property (nonatomic) NSInteger gameSize;
@property (nonatomic) NSInteger time;
@property (nonatomic) BOOL isElianToEnglish;

@end
