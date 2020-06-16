//
//  CreateRQCodeViewController.m
//  DiDi
//
//  Created by jaybin on 15/8/4.
//  Copyright (c) 2015年 jaybin. All rights reserved.
//

#import "CreateRQCodeViewController.h"
#import "QRCodeGenerator.h"
#import "Masonry.h"

#define IOS_VERSION    [[[UIDevice currentDevice] systemVersion] floatValue]


@interface CreateRQCodeViewController ()

@end

@implementation CreateRQCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if(IOS_VERSION>=7.0){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    NSUserDefaults *patient =[NSUserDefaults standardUserDefaults];
    NSString *person = [[NSString alloc]init];
    
    NSString *name = [[NSString alloc]init];
    NSString *gender = [[NSString alloc]init];
    NSString *birthday = [[NSString alloc]init];
    NSString *degree = [[NSString alloc]init];
    NSString *maritalStatus = [[NSString alloc]init];
    NSString *workingCondition = [[NSString alloc]init];
    
    
    NSString *emotionalState = [[NSString alloc]init];
    NSString *speakThink = [[NSString alloc]init];
    NSString *appearanceActions = [[NSString alloc]init];
    NSString *cognitive = [[NSString alloc]init];
    NSString *insight = [[NSString alloc]init];
    NSString *cognitiveFunction = [[NSString alloc]init];
    
    
    NSString *chiefComplaint = [[NSString alloc]init];
    NSString *drugAllergy = [[NSString alloc]init];
    NSString *surgicalTrauma = [[NSString alloc]init];
    NSString *familyHistory = [[NSString alloc]init];
    NSString *somaticDiseases = [[NSString alloc]init];
    NSString *physicalExamination = [[NSString alloc]init];
    
    name=[patient objectForKey:@"name"];
    gender=[patient objectForKey:@"gender"];
    birthday =[patient objectForKey:@"birthday"];
    degree =[patient objectForKey:@"degree"];
    maritalStatus =[patient objectForKey:@"maritalStatus"];
    workingCondition =[patient objectForKey:@"workingCondition"];
    
    emotionalState =[patient objectForKey:@"emotionalState"];
    speakThink =[patient objectForKey:@"speakThink"];
    appearanceActions =[patient objectForKey:@"appearanceActions"];
    cognitive =[patient objectForKey:@"cognitive"];
    insight =[patient objectForKey:@"insight"];
    cognitiveFunction =[patient objectForKey:@"cognitiveFunction"];

    
    chiefComplaint =[patient objectForKey:@"chiefComplaint"];
    drugAllergy =[patient objectForKey:@"drugAllergy"];
    surgicalTrauma =[patient objectForKey:@"surgicalTrauma"];
    familyHistory =[patient objectForKey:@"familyHistory"];
    somaticDiseases =[patient objectForKey:@"somaticDiseases"];
    physicalExamination =[patient objectForKey:@"physicalExamination"];

    person=@"";
    
    person = [person stringByAppendingString:name];
    person = [person stringByAppendingString:gender];
    person = [person stringByAppendingString:birthday];
    person = [person stringByAppendingString:degree];
    person = [person stringByAppendingString:maritalStatus];
    person = [person stringByAppendingString:workingCondition];
    
    person = [person stringByAppendingString:emotionalState];
    person = [person stringByAppendingString:speakThink];
    person = [person stringByAppendingString:appearanceActions];
    person = [person stringByAppendingString:cognitive];
    person = [person stringByAppendingString:insight];
    person = [person stringByAppendingString:cognitiveFunction];
    
    person = [person stringByAppendingString:chiefComplaint];
    person = [person stringByAppendingString:drugAllergy];
    person = [person stringByAppendingString:surgicalTrauma];
    person = [person stringByAppendingString:familyHistory];
    person = [person stringByAppendingString:somaticDiseases];
    person = [person stringByAppendingString:physicalExamination];
    
    testImageView.image = [QRCodeGenerator qrImageForString:person imageSize:testImageView.bounds.size.width];
    
}

#pragma mark - UITextFieldDelegate

-(void)buttonClicked:(id)sender{
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 100://生成二维码
        {
            /*字符转二维码
             */
//            testImageView.image = [QRCodeGenerator qrImageForString:person imageSize:testImageView.bounds.size.width];
        }
            break;
        case 101://保存二维码到相册
        {
            [self saveImageToAlbum];
        }
            break;
        default:
            break;
    }
    
}

//保存二维码图片到相册
-(void)saveImageToAlbum
{
    UIImageWriteToSavedPhotosAlbum(testImageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

//保存图片回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *) error contextInfo:(void *)contextInfo
{
    if(error != NULL)
    {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"请打开应用的相册权限" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        }];
        [alertVC addAction:action];
        [self presentViewController:alertVC animated:YES completion:^{
        }];
    }
    else
    {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"已保存到相册" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        }];
        [alertVC addAction:action];
        [self presentViewController:alertVC animated:YES completion:^{
        }];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
