//
//  InformationFeedbackDetailViewController.h
//  BRSF
//
//  Created by mac on 16/3/10.
//  Copyright © 2016年 HongTao. All rights reserved.
//

#import "InformationFeedbackDetailViewController.h"
#import "PlaceholderTextView.h"
#import "FMDatabase.h"
#import "XFNotices.h"
#define kTextBorderColor     RGBCOLOR(227,224,216)

#undef  RGBCOLOR
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface InformationFeedbackDetailViewController ()<UITextViewDelegate,UINavigationControllerDelegate>

@end

@implementation InformationFeedbackDetailViewController

- (void)viewDidLoad {
    NSLog(@"title---- %@",self.title);
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path = [doc stringByAppendingPathComponent:@"DOCTOR.sqlite"];
    NSLog(@"path===%@",path);
    self.dbPath = path;
    
    self.view.backgroundColor = [UIColor colorWithRed:229.0/255 green:229.0/255 blue:229.0/255 alpha:1.0f];
    self.aView = [[UIView alloc]init];
    _aView.backgroundColor = [UIColor whiteColor];
    _aView.frame = CGRectMake(20, 124, self.view.frame.size.width - 40, 180);
    [self.view addSubview:_aView];
    
    self.navigationItem.title = @"个人记录";
    
    
    _titleTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 84, self.view.frame.size.width - 40, 30)];
    _titleTextField.borderStyle = UITextBorderStyleRoundedRect;
    _titleTextField.placeholder = @"请输入标题";
    _titleTextField.text=self.title;
    _titleTextField.delegate = self;
    [self titleLimit:_titleTextField];
    [self.view addSubview:_titleTextField];
    
    
    
    self.wordCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.textView.frame.origin.x + 20,  self.textView.frame.size.height + 84 - 1, [UIScreen mainScreen].bounds.size.width - 40, 40)];
    _wordCountLabel.font = [UIFont systemFontOfSize:14.f];
    _wordCountLabel.textColor = [UIColor lightGrayColor];
    self.wordCountLabel.text = @"0/300";
    self.wordCountLabel.backgroundColor = [UIColor whiteColor];
    self.wordCountLabel.textAlignment = NSTextAlignmentRight;
    //
    //    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(self.textView.frame.origin.x + 20,  self.textView.frame.size.height + 84 - 1 + 23, [UIScreen mainScreen].bounds.size.width - 40, 1)];
    //    lineView.backgroundColor = [UIColor lightGrayColor];
    //
    //    [self.view addSubview:lineView];
    //
    [self.view addSubview:_wordCountLabel];
    [_aView addSubview:self.textView];
    
    
    
    
    FMDatabase *db = [[FMDatabase alloc]initWithPath:self.dbPath];
    if ([db open]) {
        NSString *sql = @"Select txt from PERSONRECORD where title=?";
        NSString *result = [db executeQuery:sql,_titleTextField.text];
           NSLog(@"result --> %@",result);
    }
    
 
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    _mysendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _mysendButton.layer.cornerRadius = 2.0f;
    _mysendButton.frame = CGRectMake(20, 364, self.view.frame.size.width - 40, 40);
    _mysendButton.backgroundColor = [self colorWithRGBHex:0x60cdf8];
    [_mysendButton setTitle:@"更新" forState:UIControlStateNormal];
    [_mysendButton addTarget:self action:@selector(updateNewUserInfo) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_mysendButton];
    

    
}





-(PlaceholderTextView *)textView{
    
    if (!_txtView) {
        _txtView = [[PlaceholderTextView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 40, 200)];
        _txtView.backgroundColor = [UIColor whiteColor];
        _txtView.delegate = self;
        _txtView.font = [UIFont systemFontOfSize:14.f];
        _txtView.textColor = [UIColor blackColor];
        _txtView.textAlignment = NSTextAlignmentLeft;
        _txtView.editable = YES;
        _txtView.layer.cornerRadius = 4.0f;
        _txtView.layer.borderColor = kTextBorderColor.CGColor;
        _txtView.layer.borderWidth = 0.5;
        _txtView.placeholderColor = RGBCOLOR(0x89, 0x89, 0x89);
        _txtView.placeholder = @"每天或者每周做个记录~";
        
        
    }
    
    return _txtView;
}

//把回车键当做退出键盘的响应键  textView退出键盘的操作
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([@"\n" isEqualToString:text] == YES)
    {
        [textView resignFirstResponder];
        
        
        return NO;
    }
    
    return YES;
}

//- (UIButton *)sendButton{
//
//    if (!_mysendButton) {
//        _mysendButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _mysendButton.layer.cornerRadius = 2.0f;
//        _mysendButton.frame = CGRectMake(20, 364, self.view.frame.size.width - 40, 40);
//        _mysendButton.backgroundColor = [self colorWithRGBHex:0x60cdf8];
//        [_mysendButton setTitle:@"提交" forState:UIControlStateNormal];
//        [_mysendButton addTarget:self action:@selector(addNewUserInfo) forControlEvents:UIControlEventTouchUpInside];
//    }
//
//    return _mysendButton;
//
//}


- (void)updateNewUserInfo
{
    FMDatabase *db = [[FMDatabase alloc]initWithPath:self.dbPath];
    if ([db open]) {
        
        if (_txtView.text.length == 0||_titleTextField.text.length == 0){
            
            [XFNotices noticesWithTitle:@"请完成填写信息" Time:1.5 View:self.view Style:(XFNoticesStyleFail)];
        }else{
            NSLog(@"txtView==%@",_txtView.text);
            NSLog(@"_titleTextField==%@",_titleTextField.text);
            NSString *sql= nil;
            
            
            NSDateFormatter* formatter =[[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
            _createtimeStr = [formatter stringFromDate:[NSDate date]];
            NSLog(@"createtime==%@",_createtimeStr);
            if (self.operateType == 0){//执行插入操作
                sql = @"UPDATE PERSONRECORD set txt=? where title=?";
            }
            NSLog(@"_txtView==%@", _txtView.text);
            BOOL res = [db executeUpdate:sql,_txtView.text,_titleTextField.text];
            if (!res) {
                [XFNotices noticesWithTitle:@"数据插入错误" Time:1.5 View:self.view Style:(XFNoticesStyleFail)];
            }else{
                [XFNotices noticesWithTitle:@"数据插入成功" Time:1.5 View:self.view Style:(XFNoticesStyleFail)];
            }
        }
    }else{
        NSLog(@"数据库打开失败") ;
    }
    if (operateType1 == 0)//如果是添加就留在该页，如果是修改就跳回上一页
    {
        [_txtView resignFirstResponder];
        
        _txtView.text = @"";
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    [db close];
}





- (UIColor *)colorWithRGBHex:(UInt32)hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}


#pragma mark textField的字数限制

//在这个地方计算输入的字数
- (void)textViewDidChange:(UITextView *)textView
{
    NSInteger wordCount = textView.text.length;
    self.wordCountLabel.text = [NSString stringWithFormat:@"%ld/300",(long)wordCount];
    [self wordLimit:textView];
}
#pragma mark 超过300字不能输入
-(BOOL)wordLimit:(UITextView *)text{
    if (text.text.length < 300) {
        //NSLog(@"%ld",text.text.length);
        self.textView.editable = YES;
        
    }
    else{
        self.textView.editable = NO;
        
    }
    return nil;
}




-(BOOL)titleLimit:(UITextView *)text{
    if (text.text.length < 10) {
        //NSLog(@"%ld",text.text.length);
        self.textView.editable = YES;
        
    }
    else{
        self.textView.editable = NO;
        
    }
    return nil;
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [_textView resignFirstResponder];
//    [_textField resignFirstResponder];
//}




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
