//
//  JZPuvlicController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/4.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//  问题：自定义backbutton后无法左滑返回

#import "JZPublicController.h"
#import "TBCityIconFont.h"
#import "JZTextView.h"
#import "UIView+JZFrame.h"

@interface JZPublicController ()<UITextViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic,assign) NSInteger handle;
@property (nonatomic,weak) JZTextView *textView;
@property (nonatomic,strong) NSMutableArray *imagesArr;
@property (nonatomic,weak) UIBarButtonItem *rightButton;


@end

@implementation JZPublicController


-(NSMutableArray *)imagesArr
{
    if (_imagesArr == nil) {
        _imagesArr = [NSMutableArray array];
    }
    return _imagesArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.title = @"发布动态";
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(send)];
    self.rightButton = rightButton;
    self.navigationItem.rightBarButtonItem = rightButton;
    rightButton.enabled = NO;
    
    
    JZTextView * textView = [[JZTextView alloc]initWithFrame:CGRectMake(5, 10, self.view.width-10, 70)];
    textView.placeholder = @"请输入您要输入的文字";
    textView.delegate = self;
    self.textView = textView;
    [self.view addSubview:textView];
    
    [self setUpImageViews];
    
    
}
//发布动态
-(void)send
{
    NSLog(@"哔~哔~发送");
}

-(void)setUpImageViews
{
    CGFloat margin = 10;
    CGFloat w = 60;
    
    for (int i = 0; i<9; i++) {
        UIImageView *p = [[UIImageView alloc]init];
        if (i) {
            p.hidden = YES;
        }
        CGFloat x = margin + i%4*(margin + w);
        CGFloat y =CGRectGetMaxY(self.textView.frame)+margin + i/4*(w+margin);
        p.frame = CGRectMake(x, y, w, w);
        [p setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e7ad", w, [UIColor lightGrayColor])]];
        p.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pickPicture:)];
        [p addGestureRecognizer:tapG];
        p.tag = i;
        [self.imagesArr addObject:p];
        [self.view addSubview:p];
    }
}


-(void)pickPicture:(UIGestureRecognizer *)gesture
{
    self.handle = gesture.view.tag;
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [self presentViewController:alertVC animated:YES completion:nil];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        // 打开相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
            imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePickerVC.delegate = self;
            
            [self presentViewController:imagePickerVC animated:YES completion:nil];
        }
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        // 打开相册
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            imagePicker.delegate = self;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
}


#pragma mark - imagePicker代理

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //取出选中的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    UIImage *afterImage = [self imageFromImage:image inRect:CGRectMake(100, 100, 500, 500)];
    //把图片添加进imageView
    UIImageView * imageView = self.imagesArr[self.handle];
    imageView.image = afterImage;
    //显示下一个“添加图片”
    if (self.handle!=8) {
        [self.imagesArr[self.handle+1] setHidden:NO];
    }
    
    self.rightButton.enabled = YES;
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

/**
 *从图片中按指定的位置大小截取图片的一部分
 * UIImage image 原始的图片
 * CGRect rect 要截取的区域
 */
-(UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect{
    
    //将UIImage转换成CGImageRef
    CGImageRef sourceImageRef = [image CGImage];
    
    //按照给定的矩形区域进行剪裁
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    
    //将CGImageRef转换成UIImage
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    
    //返回剪裁后的图片
    return newImage;
}

#pragma mark - textView代理
-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length) {
        self.textView.hidePlaceholder = YES;
        self.rightButton.enabled = YES;
    }else {
        self.textView.hidePlaceholder = NO;
        self.rightButton.enabled = NO;
    }
}

@end
