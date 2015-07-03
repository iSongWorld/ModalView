//
//  ModalView.m
//  Example
//
//  Created by 陈荣雄 on 15/3/18.
//  Copyright (c) 2015年 陈荣雄. All rights reserved.
//

#import "ModalView.h"

@interface ModalView ()

@property (weak, nonatomic) UIView *mainView;
@property (assign, nonatomic) BOOL isAnimating;

@end

@implementation ModalView

- (instancetype)initWithView:(UIView *)mainView
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self = [super initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    if (self) {
        self.windowLevel = UIWindowLevelAlert;
        self.backgroundColor = [UIColor clearColor];
        _mainView = mainView;
        [self addSubview:_mainView];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self dismiss];
}

- (void)show {
    if (self.isAnimating) {
        return;
    }
    
    self.isAnimating = YES;
    
    [self makeKeyAndVisible];
    
    // Make the view small and transparent before animation
    self.mainView.alpha = 0.f;
    self.mainView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    
    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        weakSelf.mainView.alpha = 1.f;
        weakSelf.mainView.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            weakSelf.mainView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            weakSelf.isAnimating = NO;
        }];
    }];
}

- (void)dismiss {
    if (self.isAnimating) {
        return;
    }
    self.isAnimating = YES;
    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.mainView.alpha = 0.1f;
        weakSelf.mainView.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    } completion:^(BOOL finished) {
        [weakSelf resignKeyWindow];
        weakSelf.hidden = YES;
        self.isAnimating = NO;
    }];
}

@end
