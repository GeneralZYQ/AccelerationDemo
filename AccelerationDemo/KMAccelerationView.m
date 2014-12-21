//
//  KMAccelerationView.m
//  AccelerationDemo
//
//  Created by 张元清 on 14/12/20.
//  Copyright (c) 2014年 张元清. All rights reserved.
//

#import "KMAccelerationView.h"

@interface KMAccelerationView ()

@property (nonatomic, strong) UIView *movingBall;
@property (nonatomic, strong) UIView *orbit;

@property NSTimeInterval progress;
@property NSTimeInterval lastUpdate;
@property NSTimeInterval totalTime;

@property (nonatomic, assign) CGFloat acceleration;

@end

@implementation KMAccelerationView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        CGFloat orbitWidth = 2.0;
        self.orbit = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width - orbitWidth) / 2, 0, orbitWidth, frame.size.height)];
        self.orbit.backgroundColor = [UIColor blackColor];
        [self addSubview:self.orbit];
        
        CGFloat movingBallSideLength = 10;
        
        self.movingBall = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width - movingBallSideLength) / 2, movingBallSideLength, movingBallSideLength, movingBallSideLength)];
        self.movingBall.backgroundColor = [UIColor blackColor];
        self.movingBall.layer.cornerRadius = movingBallSideLength / 2;
        [self addSubview:self.movingBall];
    }
    
    return self;
}

- (void)moveFrom:(CGFloat)startingPlace to:(CGFloat)destinationPlace withAcceleration:(CGFloat)acceleration {
    
    self.startingValue = startingPlace;
    self.destinationValue = destinationPlace;
    self.acceleration = acceleration;
    
    [self.timer invalidate];
    self.timer = nil;
    
    if (acceleration == 0) {
        
        CGRect rect = CGRectMake(self.movingBall.frame.origin.x, destinationPlace, self.movingBall.frame.size.width, self.movingBall.frame.size.height);
        self.movingBall.frame = rect;
        
        return;
    }
    

    self.startDate = [NSDate date];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:(1.0f/30.0f) target:self selector:@selector(updateValue:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    self.timer = timer;
}

- (void)updateValue:(NSTimer *)timer {
    
    
    CGFloat interval = [[NSDate date] timeIntervalSinceDate:self.startDate];

    CGFloat deltaS = self.acceleration * interval * interval;
    
    CGRect rect = self.movingBall.frame;
    rect.origin.y = self.startingValue + deltaS;
    self.movingBall.frame = rect;
    
    if (rect.origin.y >= self.destinationValue) {
        [self.timer invalidate];
        self.timer = nil;
        rect.origin.y = self.destinationValue;
        self.movingBall.frame = rect;
        
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
