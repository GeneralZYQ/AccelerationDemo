//
//  KMAccelerationView.h
//  AccelerationDemo
//
//  Created by 张元清 on 14/12/20.
//  Copyright (c) 2014年 张元清. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMAccelerationView : UIView

@property float startingValue;
@property float destinationValue;

@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, weak) NSTimer *timer;

- (void)moveFrom:(CGFloat)startingPlace to:(CGFloat)destinationPlace withAcceleration:(CGFloat)acceleration;

@end
