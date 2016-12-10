//
//  JZTextView.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/4.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZTextView : UITextView

@property (nonatomic,copy) NSString *placeholder;
@property (nonatomic,assign) BOOL hidePlaceholder;

@end
