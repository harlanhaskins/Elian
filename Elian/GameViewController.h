//
//  GameViewController.h
//  Elian
//
//  Created by Harlan Haskins on 8/18/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import "CustomUIButton.h"
#import "Game.h"

@interface GameViewController : UIViewController
@property (nonatomic) UILabel *letterLabel;
@property (nonatomic) UILabel *choice1Label;
@property (nonatomic) UILabel *choice2Label;
@property (nonatomic) UILabel *choice3Label;
@property (nonatomic) UILabel *correctAnswerLabel;
@property (nonatomic) UILabel *incorrectAnswerLabel;
@property (nonatomic) UILabel *timeLabel;
@property (nonatomic) UILabel *bestTimeLabel;
@property (nonatomic) Game *currentGame;
@property NSTimer* timer;
@property NSString* alphabet;
@property int correctChoice;
@property int incorrectAnswers;
@property int playedRounds;
@property int gameLength;

-(void) updateTime;
-(IBAction) choiceMade:(id)sender;
-(NSString*) shuffledAlphabet:(NSString*)finalLettersString;
-(void) setUpRound;

@end
