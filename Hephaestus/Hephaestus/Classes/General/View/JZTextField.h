//
//  JZTextField.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/3.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JZTextField;
@protocol JZTextFieldDelegate <NSObject>
@optional
-(void)JZTextField:(JZTextField *)textField didClickRightButton:(UIButton *)btn;

@end


@interface JZTextField : UITextField

@property (nonatomic, weak) id<JZTextFieldDelegate> JZDelegate;

-(void)setBackgroundColor:(UIColor *)bgColor isRightBtn:(BOOL)rBOOL isLeftBtn:(BOOL)lBOOL placeholder:(NSString *)placehodlder;

@end
