//
//  JZCameraController.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/13.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZBaseViewController.h"
@class JZCameraController;

@protocol JZCameraDelegate <NSObject>
@optional
-(void)JZCamera:(JZCameraController *)Camera didTakePhoto:(UIImage *)image;

@end


@interface JZCameraController : JZBaseViewController

@property (nonatomic, weak) id<JZCameraDelegate> delegate;

@end
