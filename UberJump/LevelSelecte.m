//
//  LevelSelecte.m
//  UberJump
//
//  Created by vankhangfet on 6/8/14.
//  Copyright (c) 2014 thetobystephens. All rights reserved.
//

#import "LevelSelecte.h"
#import "GameState.h"
#import "MyScene.h"
@implementation LevelSelecte


- (id) initWithSize:(CGSize)size
{
	if (self = [super initWithSize:size]) {
        
        //init Background
		SKSpriteNode* background = [SKSpriteNode spriteNodeWithImageNamed:@"LevelBackground"];
        background.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        background.zPosition = 100;
        [self addChild:background];
        
        
        texture1 = [SKTexture textureWithImageNamed:@"level1Botton.png"];
        texture10 = [SKTexture textureWithImageNamed:@"level1BottonActive"];
        
        texture2 = [SKTexture textureWithImageNamed:@"level2Botton.png"];
        texture20 = [SKTexture textureWithImageNamed:@"level2BottonActive"];
        
        texture3 = [SKTexture textureWithImageNamed:@"level3Botton.png"];
        texture30 = [SKTexture textureWithImageNamed:@"level3BottonActive"];
        
        texture4 = [SKTexture textureWithImageNamed:@"level4Botton.png"];
        texture40 = [SKTexture textureWithImageNamed:@"level4BottonActive"];
        
        texture5 = [SKTexture textureWithImageNamed:@"level5Botton.png"];
        texture50 = [SKTexture textureWithImageNamed:@"level5BottonActive"];
        
        node1 = [SKSpriteNode spriteNodeWithTexture:texture10];
        node1.position = CGPointMake(self.frame.size.width * 0.70, self.frame.size.height* 0.13);
        node1.zPosition = 120;
        [self addChild:node1];
        
        node2 = [SKSpriteNode spriteNodeWithTexture:texture2];
        node2.position = CGPointMake(self.frame.size.width * 0.3, self.frame.size.height* 0.30);
        node2.zPosition = 120;
        [self addChild:node2];
        
        
        node3 = [SKSpriteNode spriteNodeWithTexture:texture3];
        node3.position = CGPointMake(self.frame.size.width * 0.70, self.frame.size.height* 0.45);
        node3.zPosition = 115;
        [self addChild:node3];
        
        node4 = [SKSpriteNode spriteNodeWithTexture:texture4];
        node4.position = CGPointMake(self.frame.size.width * 0.25, self.frame.size.height* 0.60);
        node4.zPosition = 110;
        [self addChild:node4];
        
        node5 = [SKSpriteNode spriteNodeWithTexture:texture5];
        node5.position = CGPointMake(self.frame.size.width * 0.75, self.frame.size.height* 0.78);
        node5.zPosition = 105;
        [self addChild:node5];
        
        inActiveLevel = [NSArray arrayWithObjects:node1,node2,node3,node4,node5, nil];
        activeLevel  =  [NSArray arrayWithObjects:texture10,texture20,texture30,texture40,texture50, nil];
        
        if([GameState sharedInstance].unlockLevel > 1)
        {
            for (int i = 0; i< inActiveLevel.count; i++) {
                if(i < ([GameState sharedInstance].unlockLevel) )
                {
                   
                    SKSpriteNode * tempObj =    [inActiveLevel objectAtIndex:i];
                    tempObj.texture  = (SKTexture*) [activeLevel objectAtIndex:i];
                }
            }
        
        }
        
	}
	
    NSError *errorMap;
    NSURL *mapMusicURL = [[NSBundle mainBundle] URLForResource:@"click_select.mp3" withExtension:nil];
    selectButton = [[AVAudioPlayer alloc] initWithContentsOfURL:mapMusicURL error:&errorMap];
    selectButton.volume = 10.0;
    
	return self;
}

-(void)setHero:(int)hero
{
    _currentHero = hero;
}
-(void)setLevel:(int)level
{
    _currentLevel = level;

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    
    if ([node1 containsPoint:location])
    {
        _currentLevel = 1;
        [selectButton play];
    }
    
    if ([node2 containsPoint:location])
    {
        _currentLevel = 2;
        [selectButton play];
    }
    
    if ([node3 containsPoint:location])
    {
        _currentLevel = 3;
        [selectButton play];
    }
    
    if ([node4 containsPoint:location])
    {
        _currentLevel = 4;
        [selectButton play];
    }
    
    if ([node5 containsPoint:location])
    {
        _currentLevel = 5;
        [selectButton play];
    }
    
    MyScene* gameScene = [[MyScene alloc] initWithSize:self.size];
    [gameScene setCurrentLevel:_currentLevel];
    [gameScene setHero:_currentHero];
    [self.view presentScene:gameScene];
    
    
}
@end
