//
//  EndGameScene.m
//  UberJump
//

#import "EndGameScene.h"
#import "MyScene.h"
#import "LevelSelecte.h"
#import "GameStartScene.h"
@implementation EndGameScene

-(void)setLevel:(int)level
{
    _currentLevel = level;
}
-(void)setHeroEndGame:(int)Hero
{
    _hero = Hero;
    if(_hero!=1)
    {
        SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:@"gameover_Samurai"];
        background.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        background.zPosition = 100;
        [self addChild:background];
    }
    else
    {
        SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:@"gameover_Ninja"];
        background.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addChild:background];
    }


}
- (id) initWithSize:(CGSize)size
{
	if (self = [super initWithSize:size]) {
        
        //init Background
        
        
		// Stars
		SKSpriteNode *star = [SKSpriteNode spriteNodeWithImageNamed:@"Star"];
		star.position = CGPointMake(25, self.size.height-30);
        star.zPosition = 110;
		[self addChild:star];
        
		SKLabelNode *lblStars = [SKLabelNode labelNodeWithFontNamed:@"ChalkboardSE-Bold"];
    lblStars.fontSize = 30;
    lblStars.fontColor = [SKColor whiteColor];
    lblStars.position = CGPointMake(50, self.size.height-40);
		lblStars.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
		[lblStars setText:[NSString stringWithFormat:@"X %d", [GameState sharedInstance].stars]];
        lblStars.zPosition = 110;
    [self addChild:lblStars];
		
		// Score
    SKLabelNode *lblScore = [SKLabelNode labelNodeWithFontNamed:@"ChalkboardSE-Bold"];
    lblScore.fontSize = 60;
    lblScore.fontColor = [SKColor whiteColor];
    lblScore.position = CGPointMake(self.frame.size.width * 0.8, self.frame.size.height * 0.95 );// CGPointMake(160, 300);
    lblScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    [lblScore setText:[NSString stringWithFormat:@"%d", [GameState sharedInstance].score]];
         lblScore.zPosition = 110;
    [self addChild:lblScore];
		
    // High Score
    SKLabelNode *lblHighScore = [SKLabelNode labelNodeWithFontNamed:@"ChalkboardSE-Bold"];
    lblHighScore.fontSize = 30;
    lblHighScore.fontColor = [SKColor cyanColor];
    lblHighScore.position = CGPointMake(self.frame.size.width/2, self.frame.size.width * 0.35 );//CGPointMake(160, 150);
    lblHighScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
    [lblHighScore setText:[NSString stringWithFormat:@"High Score: %d", [GameState sharedInstance].highScore]];
        lblHighScore.zPosition = 110;
    [self addChild:lblHighScore];
		
		// Try again
    lblTryAgain = [SKLabelNode labelNodeWithFontNamed:@"ChalkboardSE-Bold"];
    lblTryAgain.fontSize = 30;
    lblTryAgain.fontColor = [SKColor whiteColor];
    lblTryAgain.position = CGPointMake(self.frame.size.width/2, self.frame.size.width * 0.25 ); //CGPointMake(160, 50);
		lblTryAgain.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
		[lblTryAgain setText:@"Tap To Try Again"];
        lblTryAgain.zPosition = 110;
    [self addChild:lblTryAgain];
        
        lblHome = [SKLabelNode labelNodeWithFontNamed:@"ChalkboardSE-Bold"];
        lblHome.fontSize = 30;
        lblHome.fontColor = [SKColor whiteColor];
        lblHome.position = CGPointMake(self.frame.size.width/2, self.frame.size.width * 0.15 ); //CGPointMake(160, 50);
		lblHome.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeCenter;
		[lblHome setText:@"Back to Select Hero"];
        lblHome.zPosition = 110;
        [self addChild:lblHome];
        
	}
	
    NSError *errorMap;
    NSURL *mapMusicURL = [[NSBundle mainBundle] URLForResource:@"click_select.mp3" withExtension:nil];
    selectButton = [[AVAudioPlayer alloc] initWithContentsOfURL:mapMusicURL error:&errorMap];
    selectButton.volume = 10.0;
    
	return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	// Transition back to the Game
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    if ([lblTryAgain containsPoint:location])
    {
        MyScene *myScene = [[MyScene alloc] initWithSize:self.size];
        [myScene setHero:_hero];
        [myScene setCurrentLevel:_currentLevel];
        SKTransition *reveal = [SKTransition fadeWithDuration:0.5];
        [self.view presentScene:myScene transition:reveal];
        
        [selectButton play];
    }
    
    if ([lblHome containsPoint:location])
    {
        GameStartScene *myScene = [[GameStartScene alloc] initWithSize:self.size];
        SKTransition *reveal = [SKTransition fadeWithDuration:0.5];
        [self.view presentScene:myScene transition:reveal];
        [selectButton play];
    }
}



@end
