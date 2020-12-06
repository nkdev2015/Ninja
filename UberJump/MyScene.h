//
//  MyScene.h
//  UberJump
//

#import <SpriteKit/SpriteKit.h>
@import AVFoundation;
@interface MyScene : SKScene
{
    int _currentHero;
    int _currentLevel;
    NSString *levelPlist;
     AVAudioPlayer *brackGroundSound;
}
-(void)setHero:(int)hero;
-(void)setCurrentLevel:(int)level;
@end
