//
//  ResultsViewController.h
//  Elian
//
//  Created by Harlan Haskins on 8/19/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "UIViewControllerWithBackgroundImage.h"
#import "Game.h"

@interface ResultsViewController : UIViewControllerWithBackgroundImage
@property (weak, nonatomic) IBOutlet UILabel *correctAnswerLabel;
@property (weak, nonatomic) IBOutlet UILabel *incorrectAnswerLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *bestTimeLabel;
@property (weak, nonatomic) Game *currentGame;
@end
