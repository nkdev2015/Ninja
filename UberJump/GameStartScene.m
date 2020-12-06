//
//  GameStartScene.m
//  UberJump
//
//  Created by vankhangfet on 6/2/14.
//  Copyright (c) 2014 thetobystephens. All rights reserved.
//

#import "GameStartScene.h"
#import "MyScene.h"
#import "LevelSelecte.h"

@implementation GameStartScene

- (id) initWithSize:(CGSize)size
{
  if (self = [super initWithSize:size]) {
     
      SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:@"SelectPlayBackGround.png"];
      background.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
      [self addChild:background];
      [self initHero];
      
      _selectedHero = 1;
  }
  return self;
 
}

-(void)initHero
{
    
    texture1 = [SKTexture textureWithImageNamed:@"NinjaSelected.png"];
    texture2 = [SKTexture textureWithImageNamed:@"SamuraiNotSelected.png"];
    
    texture10 = [SKTexture textureWithImageNamed:@"NinjaNotSelected.png"];
    texture20 = [SKTexture textureWithImageNamed:@"SamuraiSelected.png"];
   
     hero1 = [SKSpriteNode spriteNodeWithTexture:texture1];
    //hero1 = [SKSpriteNode spriteNodeWithImageNamed:@"NinjaSelected.png"];
    if(self.frame.size.height > 538)
    {
      hero1.position = CGPointMake(self.frame.size.width * 0.25, self.frame.size.height* 0.35);
    }
    else
    {
        hero1.position = CGPointMake(self.frame.size.width * 0.25, self.frame.size.height* 0.3);
    }
    [self addChild:hero1];
    
    
    hero2 = [SKSpriteNode spriteNodeWithTexture:texture2];
    //hero2 = [SKSpriteNode spriteNodeWithImageNamed:@"SamuraiNotSelected.png"];
    if(self.frame.size.height > 538)
    {
        hero2.position = CGPointMake(self.frame.size.width * 0.75, self.frame.size.height * 0.35);
    }
    else
    {
       hero2.position = CGPointMake(self.frame.size.width * 0.75, self.frame.size.height * 0.3);
    
    }
    [self addChild:hero2];
    
    SKTexture*  textureButton = [SKTexture textureWithImageNamed:@"SelectedButton.png"];
    _button = [SKSpriteNode spriteNodeWithTexture:textureButton];
    _button.position = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height* 0.10);
    [self addChild:_button];
    
    NSError *errorMap;
    NSURL *mapMusicURL = [[NSBundle mainBundle] URLForResource:@"click_select.mp3" withExtension:nil];
    selectButton = [[AVAudioPlayer alloc] initWithContentsOfURL:mapMusicURL error:&errorMap];
    selectButton.volume = 10.0;
   
    
    NSError *errorMapBack;
    NSURL *mapMusicBackURL = [[NSBundle mainBundle] URLForResource:@"background_music.mp3" withExtension:nil];
    brackGroundSound = [[AVAudioPlayer alloc] initWithContentsOfURL:mapMusicBackURL error:&errorMapBack];
    brackGroundSound.numberOfLoops = -1;
    brackGroundSound.volume = 10.0;
    [brackGroundSound play];

}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    if ([hero1 containsPoint:location])
    {
        // TO DO: hero1 is selected;
        _selectedHero = 1;
        hero1.texture = texture1;
        hero2.texture = texture2;
         [selectButton play];
    }
    
    if ([hero2 containsPoint:location])
    {
        // TO DO: hero1 is selected;
        hero1.texture = texture10;
        hero2.texture = texture20;
        _selectedHero = 2;
         [selectButton play];
    }
    
    if ([_button containsPoint:location])
    {
               // TO DO: MainView :))
        /*
        MyScene* gameScene = [[MyScene alloc] initWithSize:self.size];
        [gameScene setHero:_selectedHero];
        [self.view presentScene:gameScene];
        */
         [brackGroundSound stop];
         [selectButton play];
        LevelSelecte* gameScene = [[LevelSelecte alloc] initWithSize:self.size];
        [gameScene setHero:_selectedHero];
        [self.view presentScene:gameScene];
        
        
        
    }
}
@end
