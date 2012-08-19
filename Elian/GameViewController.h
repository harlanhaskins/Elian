//
//  GameViewController.h
//  Elian
//
//  Created by Harlan Haskins on 8/18/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//
#import "CustomUIButton.h"

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
@property NSTimer* timer;
@property int timeInSeconds;
@property NSString* alphabet;
@property BOOL isElianToEnglish;
@property int correctChoice;
@property int correctAnswers;
@property int incorrectAnswers;
@property int playedGames;
@property int gameLength;

-(void) updatetime;
-(IBAction) choiceMade:(id)sender;
-(NSString*) shuffledAlphabet:(NSString*)finalLettersString;
-(void) setUpGame;

@end
