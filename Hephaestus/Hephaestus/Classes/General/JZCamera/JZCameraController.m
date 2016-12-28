//
//  JZCameraController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/13.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZCameraController.h"
#import <AVFoundation/AVFoundation.h>
#import "Masonry.h"
#import "TBCityIconFont.h"
#import "NSString+JZ.h"
#import "JZButton.h"

@interface JZCameraController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)AVCaptureSession *session;
@property(nonatomic,strong)AVCaptureDeviceInput *input;
@property(nonatomic,strong)AVCaptureStillImageOutput *output;
@property(nonatomic,strong)AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic ,strong) UIView *cross;

@end

@implementation JZCameraController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

//开始任务
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self createUI];
    [_session startRunning];
}
//停止任务
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_session stopRunning];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSession];
    [self initCameraLayer];
    [self prefersStatusBarHidden];
}
//初始化session
-(void)initSession
{
    self.session = [[AVCaptureSession alloc]init];
    [self.session setSessionPreset: AVCaptureSessionPresetHigh];
    AVCaptureDevice *device=nil;
    NSArray *devices=[AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for(AVCaptureDevice *tmp in devices)
    {
        if(tmp.position==AVCaptureDevicePositionBack)
            device=tmp;
    }
    _input=[[AVCaptureDeviceInput alloc]initWithDevice:device error:nil];
    _output=[[AVCaptureStillImageOutput alloc]init];
    _output.outputSettings=@{AVVideoCodecKey:AVVideoCodecJPEG};
    if([_session canAddInput:_input])
        [_session addInput:_input];
    if([_session canAddOutput:_output])
        [_session addOutput:_output];
}

//初始化相机预览层
-(void)initCameraLayer
{
    _previewLayer=[[AVCaptureVideoPreviewLayer alloc]initWithSession:_session];
    //self.view.layer.masksToBounds=YES;
    CGRect bounds = self.view.bounds;
    
    [self.previewLayer setFrame:CGRectMake(0, 0, bounds.size.width, bounds.size.height-100)];
    
    [self.previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [self.view.layer addSublayer:_previewLayer];
}

//搭建UI
-(void)createUI
{
    //底部View
    UIView *bottomView = [[UIView alloc]init];
    [bottomView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 100));
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    //拍照label
    CGSize labelSize = [NSString sizeWithFont:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) text:@"拍照"];
    UILabel *shutterLabel = [[UILabel alloc]init];
    [shutterLabel setFont:[UIFont systemFontOfSize:12]];
    [shutterLabel setTextColor:[UIColor redColor]];
    [shutterLabel setText:@"拍照"];
    [bottomView addSubview:shutterLabel];

    [shutterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(labelSize);
        make.centerX.equalTo(bottomView.mas_centerX);
        make.top.equalTo(bottomView.mas_top).offset(10);
    }];
    
    //拍照按钮
    UIButton *shutterBtn = [[UIButton alloc]init];
    [bottomView addSubview:shutterBtn];
    [shutterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerX.equalTo(bottomView.mas_centerX);
        make.centerY.equalTo(bottomView.mas_centerY).offset(5);
    }];
    [shutterBtn setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e680", 50, [UIColor redColor])] forState:UIControlStateNormal];
    [shutterBtn setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e680", 50, [UIColor lightGrayColor])] forState:UIControlStateHighlighted];
    [shutterBtn addTarget:self action:@selector(shutter) forControlEvents:UIControlEventTouchUpInside];
    //对焦十字View
    UIView *cross = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    cross.backgroundColor=[UIColor clearColor];
    cross.hidden = YES;
    self.cross = cross;
    //十字
    UIView *line1=[[UIView alloc]initWithFrame:CGRectMake(0, 29.5, 60, 1)];
    line1.backgroundColor=[UIColor whiteColor];
    [cross addSubview:line1];
    UIView *line2=[[UIView alloc]initWithFrame:CGRectMake(29.5, 0, 1, 60)];
    line2.backgroundColor=[UIColor whiteColor];
    [cross addSubview:line2];
    [self.view addSubview:cross];
    //点击屏幕对焦手势
    UITapGestureRecognizer *foucusTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(foucus:)];
    [self.view addGestureRecognizer:foucusTap];
    
    //相册按钮
    JZButton *albumBtn = [[JZButton alloc]init];
    [albumBtn setTitle:@"从相册中选择" forState:UIControlStateNormal];
    [albumBtn setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e628", 25, [UIColor whiteColor])] forState:UIControlStateNormal];
    [albumBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    albumBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    albumBtn.layoutStyle = JXLayoutButtonStyleUpImageDownTitle;
    albumBtn.midSpacing = 4;
    [albumBtn addTarget:self action:@selector(album) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:albumBtn];
    [albumBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 38));
        make.right.equalTo(self.view.mas_right).offset(-13);
        make.bottom.equalTo(bottomView.mas_top).offset(-10);
    }];
    //返回按钮
    UIButton *backBtn = [[UIButton alloc]init];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
//    [backBtn setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e605", 25, [UIColor whiteColor])] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    backBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    backBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80, 30));
        make.left.equalTo(self.view.mas_left).offset(5);
        make.top.equalTo(self.view.mas_top).offset(25);
    }];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    //闪光灯按钮
    UIButton *flashBtn = [[UIButton alloc]init];
    [flashBtn setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e602", 25, [UIColor whiteColor])] forState:UIControlStateNormal];
    [flashBtn setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e604", 25, [UIColor whiteColor])] forState:UIControlStateSelected];
    [self.view addSubview:flashBtn];
    [flashBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.top.equalTo(backBtn.mas_top);
        make.right.equalTo(self.view.mas_right).offset(-10);
    }];
    [flashBtn addTarget:self action:@selector(flashAction:) forControlEvents:UIControlEventTouchUpInside];
}
//调用相册
-(void)album
{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        imagePicker.delegate = self;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

//返回
-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

////焦距
//-(void)adjustFocalDistance
//{
////    AVCaptureConnection *connect=[_output connectionWithMediaType:AVMediaTypeVideo];
////    connect.videoScaleAndCropFactor=2.0;
//    [_previewLayer setAffineTransform:CGAffineTransformMakeScale(1.0, 0.5)];
//}

//对焦
-(void)foucus:(UITapGestureRecognizer *)sender
{
    if(_input.device.position==AVCaptureDevicePositionFront)
        return;
    if(sender.state==UIGestureRecognizerStateRecognized)
    {
        CGPoint location=[sender locationInView:self.view];
        //对焦
        __weak typeof(self) weakSelf=self;
        [self focusOnPoint:location completionHandler:^{
            weakSelf.cross.center=location;
            weakSelf.cross.alpha=0.0;
            weakSelf.cross.hidden=NO;
            [UIView animateWithDuration:0.3 animations:^{
                weakSelf.cross.alpha=1.0;
            }completion:^(BOOL finished) {
                [UIView animateWithDuration:0.3 animations:^{
                    weakSelf.cross.alpha=0.0;
                }];
            }];
        }];
    }
}

//对某一点对焦
-(void)focusOnPoint:(CGPoint)point completionHandler:(void(^)())completionHandler
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];;
    CGPoint pointOfInterest = CGPointZero;
    CGSize frameSize = self.view.bounds.size;
    pointOfInterest = CGPointMake(point.y / frameSize.height, 1.f - (point.x / frameSize.width));
    
    if ([device isFocusPointOfInterestSupported] && [device isFocusModeSupported:AVCaptureFocusModeAutoFocus])
    {
        
        NSError *error;
        if ([device lockForConfiguration:&error])
        {
            
            if ([device isWhiteBalanceModeSupported:AVCaptureWhiteBalanceModeAutoWhiteBalance])
            {
                [device setWhiteBalanceMode:AVCaptureWhiteBalanceModeAutoWhiteBalance];
            }
            
            if ([device isFocusModeSupported:AVCaptureFocusModeContinuousAutoFocus])
            {
                [device setFocusMode:AVCaptureFocusModeAutoFocus];
                [device setFocusPointOfInterest:pointOfInterest];
            }
            
            if([device isExposurePointOfInterestSupported] && [device isExposureModeSupported:AVCaptureExposureModeContinuousAutoExposure])
            {
                [device setExposurePointOfInterest:pointOfInterest];
                [device setExposureMode:AVCaptureExposureModeContinuousAutoExposure];
            }
            
            [device unlockForConfiguration];
            if(completionHandler)
                completionHandler();
        }
    }
    else
    {
        if(completionHandler)
            completionHandler();
    }
}
//闪光灯
-(void)flashAction:(UIButton *)sender
{
    
    sender.selected=!sender.isSelected;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch] && [device hasFlash])
    {
        [device lockForConfiguration:nil];
        //闪光灯开
        if (sender.isSelected)
        {
            [device setFlashMode:AVCaptureFlashModeOn];
        }
        //闪光灯关
        else
        {
            [device setFlashMode:AVCaptureFlashModeOff];
        }
        //闪光灯自动
        //[device setFlashMode:AVCaptureFlashModeAuto];
        [device unlockForConfiguration];
    }
}

//拍照
-(void)shutter
{
    AVCaptureConnection *connect=[_output connectionWithMediaType:AVMediaTypeVideo];
    if(!connect)
    {
        NSLog(@"拍照失败");
        return;
    }
    __weak typeof(self) weakSelf=self;
    [_output captureStillImageAsynchronouslyFromConnection:connect completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if(imageDataSampleBuffer==NULL)
            return;
        NSData *imageData=[AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        UIImage *image=[UIImage imageWithData:imageData];
        [weakSelf shutterSuccessAlert];
        [weakSelf showCapturedImage:image];
    }];
}

//显示拍摄到的照片
-(void)showCapturedImage:(UIImage *)image
{
    UIImageView *imv=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imv.image=image;
    [imv setBackgroundColor:[UIColor blackColor]];
//    imv.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imv];
    imv.userInteractionEnabled=YES;
    //取消按钮
    UIButton *cancelBtn=[[UIButton alloc]init];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancelBtn.backgroundColor=[UIColor colorWithWhite:0.8 alpha:0.8];
    cancelBtn.layer.cornerRadius=5;
    cancelBtn.layer.borderColor=[UIColor whiteColor].CGColor;
    cancelBtn.layer.borderWidth=1.0;
    [cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [imv addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 40));
        make.bottom.equalTo(imv.mas_bottom).offset(-20);
        make.left.equalTo(imv.mas_left).offset(40);
    }];
    //保存按钮
    UIButton *saveBtn=[[UIButton alloc]init];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    saveBtn.backgroundColor=[UIColor colorWithWhite:0.8 alpha:0.8];
    saveBtn.layer.cornerRadius=5;
    saveBtn.layer.borderColor=[UIColor whiteColor].CGColor;
    saveBtn.layer.borderWidth=1.0;
    [saveBtn addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    [imv addSubview:saveBtn];
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 40));
        make.right.equalTo(imv.mas_right).offset(-40);
        make.bottom.equalTo(cancelBtn.mas_bottom);
    }]; 
}
//取消
-(void)cancel:(UIButton *)sender
{
    [sender.superview removeFromSuperview];
}
//保存
-(void)save:(UIButton *)sender
{
    UIImageView *imv=(UIImageView *)sender.superview;
    //保存到相册
    UIImageWriteToSavedPhotosAlbum(imv.image, nil, nil, nil);
    
    if ([self.delegate respondsToSelector:@selector(JZCamera:didTakePhoto:)]) {
        [self.delegate JZCamera:self didTakePhoto:imv.image];
    }
    
//    [imv removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:nil];
}

//播放拍照音效
-(void)shutterSuccessAlert
{
    //播放音效
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"sound.mp3" ofType:nil]],&soundID);
    //播放短音频
    AudioServicesPlaySystemSound(soundID);
    //增加震动效果
    //AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

#pragma mark - UIImagePicker 代理
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    if ([self.delegate respondsToSelector:@selector(JZCamera:didTakePhoto:)]) {
        [self.delegate JZCamera:self didTakePhoto:image];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end






