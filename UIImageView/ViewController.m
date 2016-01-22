//
//  ViewController.m
//  UIImageView
//
//  Created by 周伟 on 16/1/21.
//  Copyright © 2016年 周伟. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] resourcePath];
    NSString *imgPath = [NSString stringWithFormat: @"%@/img.jpg", path];
    NSString *imgPath1 = [NSString stringWithFormat: @"%@/img1.jpg", path];

    
    //对于比较大的图片，选用此方式加载图片，因为此方式可以自动释放内存
    UIImage *image = [[UIImage alloc]
            initWithContentsOfFile:imgPath];
    UIImage *image1 = [[UIImage alloc]
                      initWithContentsOfFile:imgPath1];
    
//    UIImage *image2 = [UIImage alloc] initWithData:(NSData *);
    
    //这种方式比较适合小图，需要缓存的图片,缺点是会占用内存
//    UIImage *image1 =[UIImage imageNamed:@'img.jpg'];
    
    //一定要载体,图片才能显示到屏幕上
    //图片显示在屏幕上的大小，是由载体控制的
    UIImageView *imgView = [[UIImageView alloc]
                initWithImage:image];
    UIImageView *imgView1 = [[UIImageView alloc]
                            initWithImage:image1];
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat imgWidth = screenWidth - 20;
    CGFloat ratio = imgView.frame.size.width / imgView.frame.size.height;
    CGFloat ratio1 = imgView1.frame.size.width / imgView1.frame.size.height;
    imgView.frame = CGRectMake(10, 100, imgWidth, imgWidth / ratio);
    imgView1.frame = CGRectMake(10, 110 + imgWidth / ratio, imgWidth, imgWidth / ratio1);
    [self.view addSubview:imgView];
    [self.view addSubview:imgView1];
    
    //内容模式
    imgView.contentMode = UIViewContentModeScaleToFill;
    imgView1.contentMode = UIViewContentModeScaleToFill;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 200, 50)];
    label.text = @"Hello, Chacha!";
    label.shadowColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    NSLog(@"Hello Chacha!");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
