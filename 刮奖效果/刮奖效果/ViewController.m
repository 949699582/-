//
//  ViewController.m
//  刮奖效果
//
//  Created by 949699582 on 2019/8/16.
//  Copyright © 2019 com.cunyin.paywaiter. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *realImg;
@property (strong, nonatomic) IBOutlet UIImageView *coverImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor darkGrayColor];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // 触摸任意位置
    UITouch *touch = touches.anyObject;
    
    // 触摸位置在图片上的坐标
   CGPoint cententPoint = [touch locationInView:self.coverImg];
    
    // 设置清除点的大小
   CGRect rect = CGRectMake(cententPoint.x, cententPoint.y, 30, 30);
    
    NSLog(@"%f  %f", self.coverImg.bounds.size.width,self.coverImg.bounds.size.height);
   // 默认是去创建一个透明的视图
   UIGraphicsBeginImageContextWithOptions(self.coverImg.bounds.size, NO, 0);
    
   // 获取上下文(画板)
   CGContextRef ref = UIGraphicsGetCurrentContext();
    
    // 把imageView的layer映射到上下文中
   [self.coverImg.layer renderInContext:ref];
    
   // 清除划过的区域
    CGContextClearRect(ref, rect);
   // 获取图片
   UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
   // 结束图片的画板, (意味着图片在上下文中消失)
  UIGraphicsEndImageContext();
  self.coverImg.image = image;
}

@end
