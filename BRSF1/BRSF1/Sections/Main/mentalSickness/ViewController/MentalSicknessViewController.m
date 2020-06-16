//
//  MentalSicknessViewController.m
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import "MentalSicknessViewController.h"

#import "SettingPatientHeaderViewController.h"
#import "FSComboListView.h"
#import "AFNetWork.h"

@interface MentalSicknessViewController ()<FSComboPickerViewDelegate>
{
    UIView *bgView;
    UITextField *emotionalState;
    UITextField *speakThink;
    UITextField *appearanceActions;
    UITextField *cognitive;
    UITextField *insight;
    UITextField *cognitiveFunction;
}


@end

@implementation MentalSicknessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title=@"精神状况";
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(clickaddBtn)];
    [addBtn setImage:[UIImage imageNamed:@"goback_back_orange_on"]];
    [addBtn setImageInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
    addBtn.tintColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    [self.navigationItem setLeftBarButtonItem:addBtn];
    
    [self createTextFields];
   
    NSUserDefaults *patient =[NSUserDefaults standardUserDefaults];
    emotionalState.text=[patient objectForKey:@"emotionalState"];
    speakThink.text=[patient objectForKey:@"speakThink"];
    appearanceActions.text=[patient objectForKey:@"appearanceActions"];
    cognitive.text=[patient objectForKey:@"cognitive"];
    insight.text=[patient objectForKey:@"insight"];
    cognitiveFunction.text=[patient objectForKey:@"cognitiveFunction"];
    
    
}

-(void)createTextFields
{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30, 75, self.view.frame.size.width-90, 30)];
    label.text=@"填写精神状况信息";
    label.textColor=[UIColor grayColor];
    label.textAlignment=NSTextAlignmentLeft;
    label.font=[UIFont systemFontOfSize:13];
    [self.view addSubview:label];
    
    CGRect frame=[UIScreen mainScreen].bounds;
    bgView=[[UIView alloc]initWithFrame:CGRectMake(10, 110, frame.size.width-20, 300)];
    bgView.layer.cornerRadius=3.0;
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    emotionalState =[self createTextFielfFrame:CGRectMake(100, 10, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"情绪状态"];
    emotionalState.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UILabel *emotionalStatelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 60, 25)];
    emotionalStatelabel.text=@"情绪状态";
    emotionalStatelabel.textColor=[UIColor blackColor];
    emotionalStatelabel.textAlignment=NSTextAlignmentLeft;
    emotionalStatelabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line1=[self createImageViewFrame:CGRectMake(20, 40, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    speakThink=[self createTextFielfFrame:CGRectMake(100, 50, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"言谈与思维"];
    speakThink.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    UILabel *speakThinklabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 52, 70, 25)];
    speakThinklabel.text=@"言谈与思维";
    speakThinklabel.textColor=[UIColor blackColor];
    speakThinklabel.textAlignment=NSTextAlignmentLeft;
    speakThinklabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line2=[self createImageViewFrame:CGRectMake(20, 90, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    appearanceActions=[self createTextFielfFrame:CGRectMake(100, 100, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"外表与行为"];
    appearanceActions.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    UILabel *appearanceActionslabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 102, 70, 25)];
    appearanceActionslabel.text=@"外表与行为";
    appearanceActionslabel.textColor=[UIColor blackColor];
    appearanceActionslabel.textAlignment=NSTextAlignmentLeft;
    appearanceActionslabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line3=[self createImageViewFrame:CGRectMake(20, 140, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    cognitive=[self createTextFielfFrame:CGRectMake(100, 150, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"认知能力"];
    cognitive.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    UILabel *cognitivelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 152, 60, 25)];
    cognitivelabel.text=@"认知能力";
    cognitivelabel.textColor=[UIColor blackColor];
    cognitivelabel.textAlignment=NSTextAlignmentLeft;
    cognitivelabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line4=[self createImageViewFrame:CGRectMake(20, 190, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    insight=[self createTextFielfFrame:CGRectMake(100, 200, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"自知力"];
    insight.clearButtonMode = UITextFieldViewModeWhileEditing;
   
    
    UILabel *insightlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 202, 60, 25)];
    insightlabel.text=@"自知力";
    insightlabel.textColor=[UIColor blackColor];
    insightlabel.textAlignment=NSTextAlignmentLeft;
    insightlabel.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line5=[self createImageViewFrame:CGRectMake(20, 240, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    cognitiveFunction=[self createTextFielfFrame:CGRectMake(100, 250, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"认知功能"];
    cognitiveFunction.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    UILabel *cognitiveFunctionlabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 252, 60, 25)];
    cognitiveFunctionlabel.text=@"认知功能";
    cognitiveFunctionlabel.textColor=[UIColor blackColor];
    cognitiveFunctionlabel.textAlignment=NSTextAlignmentLeft;
    cognitiveFunctionlabel.font=[UIFont systemFontOfSize:14];
    
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, bgView.frame.size.height+bgView.frame.origin.y+30,self.view.frame.size.width-20, 37) backImageName:nil title:@"提交" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:17] target:self action:@selector(landClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;
    
    [bgView addSubview:emotionalState];
    [bgView addSubview:emotionalStatelabel];
    [bgView addSubview:line1];
    
    [bgView addSubview:speakThink];
    [bgView addSubview:speakThinklabel];
    [bgView addSubview:line2];
    
    [bgView addSubview:appearanceActions];
    [bgView addSubview:appearanceActionslabel];
    [bgView addSubview:line3];
    
    [bgView addSubview:cognitive];
    [bgView addSubview:cognitivelabel];
    [bgView addSubview:line4];
    
    [bgView addSubview:insight];
    [bgView addSubview:insightlabel];
    [bgView addSubview:line5];
    
    [bgView addSubview:cognitiveFunction];
    [bgView addSubview:cognitiveFunctionlabel];
    
    
    
    
    
    //  [self.view addSubview:genderListView];
    
    
    
    
    
    // [self setupGenderListView];
    [self.view addSubview:landBtn];
}

-(void)landClick
{
    NSUserDefaults *patient =[NSUserDefaults standardUserDefaults];
    
    //个人病史
    [patient setObject:emotionalState.text forKey:@"emotionalState"];
    [patient setObject:speakThink.text forKey:@"speakThink"];
    [patient setObject:appearanceActions.text forKey:@"appearanceActions"];
    [patient setObject:cognitive.text forKey:@"cognitive"];
    [patient setObject:insight.text forKey:@"insight"];
    [patient setObject:cognitiveFunction.text forKey:@"cognitiveFunction"];
    
    
    NSString *postEmotionalState = emotionalState.text ;
    NSString *postSpeakThink = speakThink.text;
    NSString *postAppearanceActions = appearanceActions.text;
    NSString *postCognitive = cognitive.text;
    NSString *postInsight = insight.text;
    NSString *postCognitiveFunction = cognitiveFunction.text;
    
    
    
    AFNetWork *afNetWork = [[AFNetWork alloc] init];
    [afNetWork reach];
    [afNetWork postWithURL:@"http://115.159.159.35:3001/api/Patients" WithParmeters:@{@"emotionalState":postEmotionalState, @"speakThink":postSpeakThink,@"appearanceActions":postAppearanceActions, @"cognitive":postCognitive,@"insight":postInsight, @"cognitiveFunction":postCognitiveFunction}];
    [afNetWork setBlock:^(id info){
        
        NSLog(@"info = %@", info);
        NSArray *array = info[@"data"][@"topic"];
        NSLog(@"%@",array);
        for (int i = 0; i < array.count; i++) {
            // [_dataSource addObject:array[i]];
        }
        
        //[self.tableView reloadData];
    }];

    
    
   [[self navigationController] popViewControllerAnimated:YES];
}

-(UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder
{
    UITextField *textField=[[UITextField alloc]initWithFrame:frame];
    
    textField.font=font;
    
    textField.textColor=[UIColor grayColor];
    
    textField.borderStyle=UITextBorderStyleNone;
    
    textField.placeholder=placeholder;
    
    return textField;
}

-(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName color:(UIColor *)color
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
    
    if (imageName)
    {
        imageView.image=[UIImage imageNamed:imageName];
    }
    if (color)
    {
        imageView.backgroundColor=color;
    }
    
    return imageView;
}

-(UIButton *)createButtonFrame:(CGRect)frame backImageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    if (imageName)
    {
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (font)
    {
        btn.titleLabel.font=font;
    }
    
    if (title)
    {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (color)
    {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    if (target&&action)
    {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

-(void)clickaddBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - FSComboListView

- (void)setupGenderListView
{
    //    FSComboListView *genderListView = [[FSComboListView alloc] initWithValues:@[@"男",@"女"]frame:CGRectMake(0, 0, 300, 40)];
    //    genderListView.delegate = self;
    //    genderListView.tintColor = [UIColor darkGrayColor];
    //    genderListView.textColor = [UIColor darkGrayColor];
    //
    //    [self.view addSubview:genderListView];
}
- (void) comboboxOpened:(FSComboListView *)combobox
{
    NSLog(@"comboboxOpened");
}

- (void) comboboxClosed:(FSComboListView *)combobox
{
    NSLog(@"comboboxClosed");
}

- (void) comboboxChanged:(FSComboListView *)combobox toValue:(NSString *)toValue
{
    NSLog(@"comboboxChanged to value %@",toValue);
    
    //    _msgLabel.text = [NSString stringWithFormat:@"%lu,  %@", (unsigned long)combobox.selectedRow, toValue];
}


@end

