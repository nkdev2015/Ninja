//
//  GameStartScene.h
//  UberJump
//
//  Created by vankhangfet on 6/2/14.
//  Copyright (c) 2014 thetobystephens. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
@import AVFoundation;
@interface GameStartScene : SKScene
{
    SKSpriteNode* hero1;
    
    SKSpriteNode* hero2;
    
    SKTexture *texture1;
    SKTexture *texture2;
    
    SKTexture *texture10;
    SKTexture *texture20;
    int _selectedHero;
    
     SKSpriteNode* _button;
    
    AVAudioPlayer *selectButton;
     AVAudioPlayer *brackGroundSound;
}
@end
