//
//  ViewController.m
//  TomCat
//
//  Created by miya on 16/7/19.
//  Copyright © 2016年 miya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *imageView;
    NSMutableArray *_array;
}

@end

@implementation ViewController
#pragma mark -- 添加view
- (void)createUI{
    _array = [[NSMutableArray alloc]init];
    imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"angry_00.jpg"];
    [self.view addSubview:imageView];
    NSArray *array = @[@"cynbals",@"fart",@"larry",@"milk",@"pawn",@"switch",@"pie"];
    for (int i=0; i<7; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i<4) {
            btn.frame = CGRectMake(10,self.view.frame.size.height/2+i*45, 45, 45);
        }else{
            btn.frame = CGRectMake(self.view.frame.size.width-55, self.view.frame.size.height/2+(i-4)*45, 45, 45);
        }
        btn.tag = 100+i;
        [btn setImage:[UIImage imageNamed:array[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnWasClick:) forControlEvents:UIControlEventTouchUpInside];
        [imageView addSubview:btn];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [imageView addGestureRecognizer:tap];
    }
    
}
-(void)tapClick:(UITapGestureRecognizer *)tap{
    [self createAnimation:@"knockout_%02d" andNum:80];
    
}
- (void)btnWasClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.tag-100==0) {
        [self createAnimation:@"cymbal_%02d" andNum:13];
    }
    else if (btn.tag-100==1) {
        [self createAnimation:@"fart_%02d" andNum:27];
    }
    else if (btn.tag-100==2){
        [self createAnimation:@"eat_%02d" andNum:39];
    }
    else if (btn.tag-100==3){
        
        [self createAnimation:@"drink_%02d" andNum:80];
    }
    else if (btn.tag-100==4){
        [self createAnimation:@"scratch_%02d" andNum:55];
    }
    else if (btn.tag-100==5)
    {
        [self createAnimation:@"stomach_%02d" andNum:33];
    }else{
        [self createAnimation:@"pie_%02d" andNum:24];
    }
}
- (void)createAnimation:(NSString *)imageN andNum:(int)num{
    [_array removeAllObjects];
    for (int i=0; i<num; i++) {
        NSString *imageName = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:imageN,i] ofType:@"jpg"];
        UIImage *image = [UIImage imageWithContentsOfFile:imageName];
        [_array addObject:image];
    }
    [imageView setAnimationImages:_array];
    [imageView setAnimationDuration:_array.count*0.1];
    [imageView setAnimationRepeatCount:1];
    [imageView startAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
