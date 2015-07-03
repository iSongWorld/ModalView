//
//  ModalView.h
//  Example
//
//  Created by 陈荣雄 on 15/3/18.
//  Copyright (c) 2015年 陈荣雄. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ModalView : UIWindow

@property (assign, nonatomic) CGRect showFrame;
@property (assign, nonatomic) CGRect hideFrame;

- (instancetype)initWithView:(UIView *)mainView;

- (void)show;
- (void)dismiss;

@end
