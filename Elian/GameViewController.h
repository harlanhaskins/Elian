//
//  GameViewController.h
//  Elian
//
//  Created by Harlan Haskins on 8/18/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//
#import "CustomUIButton.h"
#import "Game.h"

@interface GameViewController : UIViewControllerWithBackgroundImage
@property (weak, nonatomic) IBOutlet UILabel *letterLabel;
@property (weak, nonatomic) IBOutlet UILabel *choice1Label;
@property (weak, nonatomic) IBOutlet UILabel *choice2Label;
@property (weak, nonatomic) IBOutlet UILabel *choice3Label;
@property (weak, nonatomic) IBOutlet UILabel *correctAnswerLabel;
@property (weak, nonatomic) IBOutlet UILabel *incorrectAnswerLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *bestTimeLabel;
@property NSManagedObjectContext *context;
@property (weak, nonatomic) Game *currentGame;
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
