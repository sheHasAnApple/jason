//
//  JZButton.h
//  test
//
//  Created by Jianzhong Huang on 2016/11/23.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface JZButton : UIButton

typedef NS_ENUM(NSInteger, JXLayoutButtonStyle) {
    JXLayoutButtonStyleLeftImageRightTitle,
    JXLayoutButtonStyleLeftTitleRightImage,
    JXLayoutButtonStyleUpImageDownTitle,
    JXLayoutButtonStyleUpTitleDownImage
} ;

/// 布局方式
@property (nonatomic, assign) JXLayoutButtonStyle layoutStyle;
/// 图片和文字的间距，默认值8
@property (nonatomic, assign) CGFloat midSpacing;

@end
