//
//  TwoDimensionCodeViewController.h
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.

#import "TwoDimensionCodeViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>
@interface TwoDimensionCodeViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic , strong) UIView *TwoCodeView;
@property (nonatomic , strong) UIView *viewPreview;
@property (nonatomic , strong) UILabel *returenLabel;
@property (nonatomic , strong) UIImageView * scanView;
@property (nonatomic , strong) UIButton * repeatBtn;
@property (nonatomic , strong) AVCaptureSession * session;
@property (nonatomic , copy) NSString * str;
@end


@implementation TwoDimensionCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _viewPreview = [[UIView alloc] init];
    _viewPreview.backgroundColor=[UIColor blackColor];
    _viewPreview.frame = self.view.bounds;
    self.view.backgroundColor=[UIColor clearColor];
    _TwoCodeView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.2, self.view.frame.size.height*0.2, self.view.frame.size.width*0.8, self.view.frame.size.height*0.8)];
    _TwoCodeView.backgroundColor=[UIColor clearColor];
    UIImageView * fraView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qrcode_border"]];
    fraView.frame=CGRectMake(1, 1, 198, 210);
    
    _scanView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qrcode_scanline_barcode"]];
    _scanView.frame=CGRectMake(1, 1, 198, 0);
    
    //扫描结果
    _returenLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 350, 300, 50)];
    //    _returenLabel.backgroundColor=[UIColor redColor];
    [self.view addSubview:_returenLabel];
    //重新扫描
    _repeatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _repeatBtn.frame= CGRectMake(20, 70, 30, 30);
    [_repeatBtn setImage:[UIImage imageNamed:@"qrcode_tabbar_icon_qrcode_highlighted"] forState:UIControlStateNormal];
    [_repeatBtn addTarget:self action:@selector(repeatScanTwoCode) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_repeatBtn];
    [_TwoCodeView addSubview:_scanView];
    [_TwoCodeView addSubview:fraView];
    [self.view addSubview:_TwoCodeView];
    [self.view insertSubview:_viewPreview atIndex:0];
    [self StartTwoCode];
    //动画
    [UIView beginAnimations:nil context:nil];
    //设定动画持续时间
    [UIView setAnimationDuration:2];
    [UIView setAnimationRepeatCount:MAXFLOAT];
    //动画的内容
    _scanView.frame=CGRectMake(1, 1, 198, 210);
    //动画结束
    [UIView commitAnimations];
}

-(void)repeatScanTwoCode{
    [_session startRunning];
    _returenLabel.text=nil;
}
-(void)StartTwoCode{
    //创建一个可以识别二维码的设备
    NSError *error;
    AVCaptureDevice * captureDevice =[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    /**
     *  因为 需要将error 传入后修改其值，然后再返回来，返回来后还要保证己经修改过了。
     
     &error传入是传的地址引用，传入后处理函数直接访问变量的地址，可以修改其值再返回同一个地址， 调用函数就可以知道值是否有修改，即是否有错
     
     而error传入是传的值引用，值引用传入到程序栈中后其实是把原来的值复制了一份传过去，处理函数可以修改，但无法将改后的值传出函数体。
     */
    AVCaptureDeviceInput * input=  [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error: &error];
    
    if (!input) {
        return ;
    }
    AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
    //设置扫描区域
    output.rectOfInterest =CGRectMake(0.2f, 0.2f, 0.8f, 0.8f);
    _session = [[AVCaptureSession alloc] init];
    [_session addInput:input];
    [_session addOutput:output];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [output setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    //创建预览图层
    AVCaptureVideoPreviewLayer *videoPreviewLayer =[[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
    [videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [videoPreviewLayer setFrame:_viewPreview.bounds];
    [_viewPreview.layer addSublayer:videoPreviewLayer];
    [_session startRunning];
    
}
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count >0)
        
    {
        //停止扫描
        [_session stopRunning];
        _str = [metadataObjects.lastObject stringValue];
        [self setText];
        [_scanView.layer removeAllAnimations];
    }
    
}
-(void)setText{
    _returenLabel.text = _str;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
