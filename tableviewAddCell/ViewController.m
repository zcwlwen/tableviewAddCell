//
//  ViewController.m
//  tableviewAddCell
//
//  Created by 张朝伟 on 16/7/27.
//  Copyright © 2016年 amailive. All rights reserved.
//

#import "ViewController.h"
#import "barrageCell.h"
#import "DMHeartFlyView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign)CGFloat heartSize;


@property (nonatomic,strong)UITableView *testTable;
@property (nonatomic,strong)NSMutableArray *dataArray1;

@end

@implementation ViewController{
    int index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    index = 3;
     _dataArray1=[[NSMutableArray alloc]initWithObjects:@"1",@"2", nil];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setUI];
     NSLog(@"%lu",(unsigned long)_dataArray1.count);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setUI{
    _testTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, 200, 360) style:UITableViewStylePlain];
    _testTable.backgroundColor = [UIColor clearColor];
    _testTable.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _testTable.contentOffset = CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX); 
    [self.view addSubview:_testTable];
    _testTable.delegate = self;
    _testTable.dataSource = self;
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    addBtn.frame = CGRectMake(220, 300, 100, 40);
    addBtn.layer.cornerRadius = 10;
    [addBtn setTitle:@"发送弹幕" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    addBtn.backgroundColor = [UIColor darkGrayColor];
    addBtn.tintColor = [UIColor whiteColor];
    
    [self.view addSubview:addBtn];
    
    // 点赞
    UIButton * heartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    heartBtn.frame = CGRectMake(36, [UIScreen mainScreen].bounds.size.height - 36 - 10, 36, 36);
    [heartBtn setImage:[UIImage imageNamed:@"icon_heart"] forState:UIControlStateNormal];
    [heartBtn addTarget:self action:@selector(showTheLove:) forControlEvents:UIControlEventTouchUpInside];
    heartBtn.layer.shadowColor = [UIColor blackColor].CGColor;
    heartBtn.layer.shadowOffset = CGSizeMake(0, 0);
    heartBtn.layer.shadowOpacity = 0.5;
    heartBtn.layer.shadowRadius = 1;
    heartBtn.adjustsImageWhenHighlighted = NO;
    [self.view addSubview:heartBtn];
}

-(void)showTheLove:(UIButton *)sender{
    
    _heartSize = 36;
    
    DMHeartFlyView* heart = [[DMHeartFlyView alloc]initWithFrame:CGRectMake(0, 0, _heartSize, _heartSize)];
    [self.view addSubview:heart];
    //设置点赞源 的位置
    CGPoint fountainSource = CGPointMake(_heartSize + _heartSize/2.0, self.view.bounds.size.height - _heartSize/2.0 - 10);
    heart.center = fountainSource;
    [heart animateInView:self.view];
    
    // button点击动画
    CAKeyframeAnimation *btnAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    btnAnimation.values = @[@(1.0),@(0.7),@(0.5),@(0.3),@(0.5),@(0.7),@(1.0), @(1.2), @(1.4), @(1.2), @(1.0)];
    btnAnimation.keyTimes = @[@(0.0),@(0.1),@(0.2),@(0.3),@(0.4),@(0.5),@(0.6),@(0.7),@(0.8),@(0.9),@(1.0)];
    btnAnimation.calculationMode = kCAAnimationLinear;
    btnAnimation.duration = 0.3;
    [sender.layer addAnimation:btnAnimation forKey:@"SHOW"];
    
}

- (void)add{
    
    [_dataArray1 addObject:[NSString stringWithFormat:@"%d",index++]];
    
    //滑动时不进行调用
    if(!_testTable.isDragging) {
        [_testTable setContentOffset:CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    }
    //手触摸、移动或者滚动时，不调用
    if(!(_testTable.isTracking || _testTable.isDragging || _testTable.isDecelerating)) {
        [_testTable setContentOffset:CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    }
    
    [_testTable reloadData];
   
    
}

#pragma mark TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray1.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    barrageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
   
    if (cell == nil) {
        cell = [[barrageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.cellBackGroundImage.image = [UIImage imageNamed:@"barrageBG"];
    cell.cellAvatorImage.image = [UIImage imageNamed:@"avator"];
    cell.barrageText.text = [NSString stringWithFormat:@"这是测试弹幕数据：%@",_dataArray1[indexPath.row]];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
