//
//  KMRoundAccelerationView.m
//  AccelerationDemo
//
//  Created by 张元清 on 14/12/20.
//  Copyright (c) 2014年 张元清. All rights reserved.
//

#import "KMRoundAccelerationView.h"

@interface KMRoundAccelerationView ()

@property (nonatomic, strong) UIView *movingBall;
@property (nonatomic, strong) UIView *orbit;

@property (nonatomic, assign) CGFloat startLength;
@property (nonatomic, assign) CGFloat endLength;
@property (nonatomic, assign) CGFloat totolDelta;

@property (nonatomic, assign) CGFloat acceleration;

@end

@implementation KMRoundAccelerationView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.clipsToBounds = NO;
        
        CGFloat sideLength = MIN(frame.size.width, frame.size.height);
        self.orbit = [[UIView alloc] initWithFrame:CGRectMake(0, 0, sideLength, sideLength)];
        self.orbit.layer.cornerRadius = sideLength / 2;
        self.orbit.layer.borderColor = [[UIColor blackColor] CGColor];
        self.orbit.layer.borderWidth = 2;
        self.orbit.center = self.center;
        [self addSubview:self.orbit];
        
        CGFloat ballSideLength = 4;
        
        self.movingBall = [[UIView alloc] initWithFrame:CGRectMake((self.orbit.frame.size.width - ballSideLength) / 2, 0, ballSideLength, ballSideLength)];
        self.movingBall.backgroundColor = [UIColor redColor];
        self.movingBall.layer.cornerRadius = ballSideLength / 2;
        [self.orbit addSubview:self.movingBall];
    }
    return self;
}

- (void)moveFromPercent:(CGFloat)startPercent toPercent:(CGFloat)destinationPercent withAcceleration:(CGFloat)acceleration {
    
    self.startingValue = startPercent;
    self.destinationValue = destinationPercent;
    self.acceleration = acceleration;
    
    self.startLength = M_PI * 2 * (startPercent / 100) * (self.orbit.frame.size.width / 2);
    self.endLength = M_PI * 2 *(destinationPercent / 100) * (self.orbit.frame.size.width / 2);
    
   self.totolDelta = self.endLength - self.startLength;
    
    [self.timer invalidate];
    self.timer = nil;
    
    if (acceleration == 0) {
        
        CGRect rect = self.movingBall.frame;
        rect.origin = CGPointMake(self.frame.size.width / 2 + sin(self.endLength / (self.orbit.frame.size.width / 2)) * (self.orbit.frame.size.width / 2),self.frame.size.height / 2 - cos(self.endLength / (self.orbit.frame.size.width / 2)) * (self.orbit.frame.size.width / 2));
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
    rect.origin = CGPointMake(self.frame.size.width / 2 + sin(deltaS / (self.orbit.frame.size.width / 2)) * (self.orbit.frame.size.width / 2),self.frame.size.height / 2 - cos(deltaS / (self.orbit.frame.size.width / 2)) * (self.orbit.frame.size.width / 2));
    self.movingBall.frame = rect;
    
    if (deltaS >= self.endLength) {
         rect.origin = CGPointMake(self.frame.size.width / 2 + sin(self.endLength / (self.orbit.frame.size.width / 2)) * (self.orbit.frame.size.width / 2),self.frame.size.height / 2 - cos(self.endLength / (self.orbit.frame.size.width / 2)) * (self.orbit.frame.size.width / 2));
        self.movingBall.frame = rect;
    }
}

@end
