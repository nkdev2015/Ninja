//
//  LevelSelecte.h
//  UberJump
//
//  Created by vankhangfet on 6/8/14.
//  Copyright (c) 2014 thetobystephens. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
@import AVFoundation;
@interface LevelSelecte : SKScene
{
    int _currentHero;
    int _currentLevel;
    int _unlockLevel;
    
    SKTexture *texture1;
    SKTexture *texture10;
    
    SKTexture *texture2;
    SKTexture *texture20;
    
    SKTexture *texture3;
    SKTexture *texture30;
    
    SKTexture *texture4;
    SKTexture *texture40;
    
    SKTexture *texture5;
    SKTexture *texture50;
    
    NSArray * activeLevel;
    NSArray * inActiveLevel;
    
    SKSpriteNode* node1;
    
    SKSpriteNode* node2;
    
    SKSpriteNode* node3;
    
    SKSpriteNode* node4;
    SKSpriteNode* node5;
    
    AVAudioPlayer *selectButton;
}

-(void)setHero:(int)hero;
-(void)setLevel:(int)level;
@end
