//
//  GameState.h
//  UberJump
//

#import <Foundation/Foundation.h>

@interface GameState : NSObject

@property (nonatomic, assign) int score;
@property (nonatomic, assign) int highScore;
@property (nonatomic, assign) int stars;
@property (nonatomic,assign)  int unlockLevel;
@property (nonatomic,assign)  int curentLevel;
+ (instancetype)sharedInstance;

- (void) saveState;

@end
