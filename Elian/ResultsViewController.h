//
//  ResultsViewController.h
//  Elian
//
//  Created by Harlan Haskins on 8/19/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "Game.h"

@interface ResultsViewController : UIViewController
@property (nonatomic) UILabel *correctAnswerLabel;
@property (nonatomic) UILabel *incorrectAnswerLabel;
@property (nonatomic) UILabel *timeLabel;
@property (nonatomic) UILabel *bestTimeLabel;
@property (nonatomic) Game *currentGame;
@end
