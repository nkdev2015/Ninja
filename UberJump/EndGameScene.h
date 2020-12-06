//
//  EndGameScene.h
//  UberJump
//

#import <SpriteKit/SpriteKit.h>
@import AVFoundation;
@interface EndGameScene : SKScene
{
    int _hero;
    int _currentLevel;
    SKLabelNode *lblTryAgain;
    SKLabelNode *lblHome;
    
     AVAudioPlayer *gameOverSound;
    AVAudioPlayer *selectButton;
}
-(void)setHeroEndGame:(int)Hero;
-(void)setLevel:(int)level;
@end
