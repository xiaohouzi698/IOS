//
//  MainViewController.m
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import "MainViewController.h"
#import "YJYYCollectionView.h"
#import "DoctorSelfViewController.h"
#import "PatientHistoryCheckViewController.h"
#import "InformationFeedbackViewController.h"
#import "PatientEmotionEvaluationViewController.h"
#import "TwoDimensionCodeViewController.h"
#import "PatientInfoCheckViewController.h"
#import "PatientSelfCheckViewController.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width


#define kImageHeight 200

#define kImageCount 4

@interface MainViewController ()

//传递给cell的图片数组
@property (nonatomic,strong)NSMutableArray * images;

@end

@implementation MainViewController

//懒加载数组
-(NSMutableArray *)images
{
    if (!_images) {
        _images = [NSMutableArray array];
        
        for (int i = 1 ; i < kImageCount+1 ; i++) {
            
            NSString * imageName = [NSString stringWithFormat:@"%02d.jpg",i];
            
            UIImage * image = [UIImage imageNamed:imageName];
            
            [_images addObject:image];
        }
    }
    
    return _images;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.view.backgroundColor = [UIColor whiteColor];

   [self setTitle:@"病人随访-医生端"];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0/255.0 green:153/255.0 blue:255/255.0 alpha:0.5]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];

  [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0/255.0 green:153/255.0 blue:255/255.0 alpha:0.5]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,nil]];
    
    CGRect patientSelfFrame = CGRectMake(38.0f, 254.0f, 60.0f, 60.0f);
    UIButton *patientSelfButton = [[UIButton alloc] initWithFrame:patientSelfFrame];
    patientSelfButton.tag = 100;
    [patientSelfButton setBackgroundImage:[UIImage imageNamed:@"DoctorSelf.png"] forState:UIControlStateNormal];
    patientSelfButton.imageEdgeInsets = UIEdgeInsetsMake(5,15,21,patientSelfButton.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
    [patientSelfButton setTitle:@"个人信息" forState:UIControlStateNormal];
    patientSelfButton.titleLabel.font = [UIFont systemFontOfSize:15];//title字体大小
    patientSelfButton.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    patientSelfButton.titleEdgeInsets = UIEdgeInsetsMake(patientSelfButton.titleLabel.bounds.size.height+80, -patientSelfButton.titleLabel.bounds.size.width-0, 0, 0);
    [patientSelfButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    patientSelfButton.hidden=NO;
    patientSelfButton.tintColor =[UIColor blackColor];
    [patientSelfButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:patientSelfButton];
    

    
    CGRect mentalSicknessfFrame = CGRectMake(138.0f, 254.0f, 60.0f, 60.0f);
    UIButton *mentalSicknessButton = [[UIButton alloc] initWithFrame:mentalSicknessfFrame];
     mentalSicknessButton.tag = 200;
    [mentalSicknessButton setBackgroundImage:[UIImage imageNamed:@"mentalSickness.png"] forState:UIControlStateNormal];
    mentalSicknessButton.imageEdgeInsets = UIEdgeInsetsMake(5,15,21,mentalSicknessButton.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
    [mentalSicknessButton setTitle:@"患者信息" forState:UIControlStateNormal];
    mentalSicknessButton.titleLabel.font = [UIFont systemFontOfSize:15];//title字体大小
    mentalSicknessButton.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    mentalSicknessButton.titleEdgeInsets = UIEdgeInsetsMake(mentalSicknessButton.titleLabel.bounds.size.height+80, -mentalSicknessButton.titleLabel.bounds.size.width-0, 0, 0);
    [mentalSicknessButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    mentalSicknessButton.hidden=NO;
    mentalSicknessButton.tintColor =[UIColor blackColor];
    [mentalSicknessButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mentalSicknessButton];

    
    
    
    CGRect personalHistoryFrame = CGRectMake(238.0f, 252.0f, 60.0f, 60.0f);
    UIButton *personalHistoryButton = [[UIButton alloc] initWithFrame:personalHistoryFrame];
     personalHistoryButton.tag = 300;
    [personalHistoryButton setBackgroundImage:[UIImage imageNamed:@"PatientInfoCheck.png"] forState:UIControlStateNormal];
    personalHistoryButton.imageEdgeInsets = UIEdgeInsetsMake(5,15,21,personalHistoryButton.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
    [personalHistoryButton setTitle:@"患者病史" forState:UIControlStateNormal];
    personalHistoryButton.titleLabel.font = [UIFont systemFontOfSize:15];//title字体大小
    personalHistoryButton.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    personalHistoryButton.titleEdgeInsets = UIEdgeInsetsMake(personalHistoryButton.titleLabel.bounds.size.height+80, -personalHistoryButton.titleLabel.bounds.size.width-0, 0, 0);
    [personalHistoryButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    personalHistoryButton.hidden=NO;
    personalHistoryButton.tintColor =[UIColor blackColor];
    [personalHistoryButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:personalHistoryButton];
    
    
    
    CGRect questionNaireFrame = CGRectMake(38.0f, 334.0f, 60.0f, 60.0f);
    UIButton *questionNaireButton = [[UIButton alloc] initWithFrame:questionNaireFrame];
    questionNaireButton.tag = 400;
    [questionNaireButton setBackgroundImage:[UIImage imageNamed:@"TwoDimensionCode.png"] forState:UIControlStateNormal];
    questionNaireButton.imageEdgeInsets = UIEdgeInsetsMake(5,15,21,questionNaireButton.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
    [questionNaireButton setTitle:@"扫二维码" forState:UIControlStateNormal];
    questionNaireButton.titleLabel.font = [UIFont systemFontOfSize:15];//title字体大小
    questionNaireButton.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    questionNaireButton.titleEdgeInsets = UIEdgeInsetsMake(questionNaireButton.titleLabel.bounds.size.height+80, -questionNaireButton.titleLabel.bounds.size.width-0, 0, 0);
    [questionNaireButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    questionNaireButton.hidden=NO;
    questionNaireButton.tintColor =[UIColor blackColor];
    [questionNaireButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:questionNaireButton];
    
    
    
    
    CGRect emotionEvaluationFrame = CGRectMake(138.0f, 332.0f, 60.0f, 60.0f);
    UIButton *emotionEvaluationButton = [[UIButton alloc] initWithFrame:emotionEvaluationFrame];
    emotionEvaluationButton.tag = 500;
    [emotionEvaluationButton setBackgroundImage:[UIImage imageNamed:@"PatientEmotionEvaluation.png"] forState:UIControlStateNormal];
    emotionEvaluationButton.imageEdgeInsets = UIEdgeInsetsMake(5,15,21,emotionEvaluationButton.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
    [emotionEvaluationButton setTitle:@"患者评估" forState:UIControlStateNormal];
    emotionEvaluationButton.titleLabel.font = [UIFont systemFontOfSize:15];//title字体大小
    emotionEvaluationButton.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    emotionEvaluationButton.titleEdgeInsets = UIEdgeInsetsMake(emotionEvaluationButton.titleLabel.bounds.size.height+80, -emotionEvaluationButton.titleLabel.bounds.size.width-0, 0, 0);
    [emotionEvaluationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    emotionEvaluationButton.hidden=NO;
    emotionEvaluationButton.tintColor =[UIColor blackColor];
    [emotionEvaluationButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:emotionEvaluationButton];
    
    CGRect personRecordFrame = CGRectMake(238.0f, 334.0f, 60.0f, 60.0f);
    UIButton *personRecordButton = [[UIButton alloc] initWithFrame:personRecordFrame];
     personRecordButton.tag = 600;
    [personRecordButton setBackgroundImage:[UIImage imageNamed:@"InformationFeedback.png"] forState:UIControlStateNormal];
    personRecordButton.imageEdgeInsets = UIEdgeInsetsMake(5,15,21,personRecordButton.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
    [personRecordButton setTitle:@"备忘录" forState:UIControlStateNormal];
    personRecordButton.titleLabel.font = [UIFont systemFontOfSize:15];//title字体大小
    personRecordButton.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    personRecordButton.titleEdgeInsets = UIEdgeInsetsMake(personRecordButton.titleLabel.bounds.size.height+80, -personRecordButton.titleLabel.bounds.size.width-0, 0, 0);
    [personRecordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    personRecordButton.hidden=NO;
    personRecordButton.tintColor =[UIColor blackColor];
    [personRecordButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:personRecordButton];
    

    
    //1.实例化 CollectionView传入 一个frame 和一个图片数组 时长 和你要添加到的view
    [YJYYCollectionView collectionViewWithFrame:CGRectMake(0, 44, kScreenWidth, kImageHeight) imageArray:self.images timeInterval:1.5 view:self.view];

}

- (void)buttonClick:(UIButton *)sender{
    
    if (sender.tag == 100) {
        
        NSLog(@"%@",@"PatientSelfCheckViewController执行委托");
        PatientSelfCheckViewController *patientSelfCheckViewController=[[PatientSelfCheckViewController alloc] init];
      
        [patientSelfCheckViewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:patientSelfCheckViewController animated:YES];
        
    }else if (sender.tag == 200){
        NSLog(@"%@",@"MentalSicknessViewController执行委托");
        PatientInfoCheckViewController *mentalSicknessViewController=[[PatientInfoCheckViewController alloc] init];
        
        [mentalSicknessViewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:mentalSicknessViewController animated:YES];
        
        
    }else if (sender.tag == 300){
        NSLog(@"%@",@"PatientHistoryCheckViewController执行委托");
        PatientHistoryCheckViewController *patientHistoryCheckViewController=[[PatientHistoryCheckViewController alloc] init];
        
        [patientHistoryCheckViewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:patientHistoryCheckViewController animated:YES];
        
       
        
    }else if (sender.tag == 400){
        NSLog(@"%@",@"QuestionNaireViewController执行委托");
        TwoDimensionCodeViewController *questionNaireViewController=[[TwoDimensionCodeViewController alloc] init];
        
        [questionNaireViewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:questionNaireViewController animated:YES];
        
       
        
    }else if (sender.tag == 500){
        NSLog(@"%@",@"EmotionEvaluationViewController执行委托");
        PatientEmotionEvaluationViewController *emotionEvaluationViewController=[[PatientEmotionEvaluationViewController alloc] init];
        
        [emotionEvaluationViewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:emotionEvaluationViewController animated:YES];
       
        
    }else if (sender.tag == 600){
        NSLog(@"%@",@"PersonRecordViewController执行委托");
        InformationFeedbackViewController *personRecordViewController=[[InformationFeedbackViewController alloc] init];
        
        [personRecordViewController setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:personRecordViewController animated:YES];
        
      
        
    }
    
}




@end

