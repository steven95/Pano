//
//  PanoGLKViewController.m
//  Panorama
//
//  Created by mac on 2022/2/6.
//  Copyright © 2022 Robby Kraft. All rights reserved.
//

#import "PanoGLKViewController.h"
#import "PanoramaView.h"
@interface PanoGLKViewController ()
{
    PanoramaView *panoramaView;
}
@end

@implementation PanoGLKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    panoramaView = [[PanoramaView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    [panoramaView setImageWithName:@"2000.jpg"];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://139.215.226.58/3911/second/master/2022/01/28/2086905334937284_1643350360460.jpg"]]];
    image = [self scaleToSize:image size:CGSizeMake(4096, 2048)];
    [panoramaView setImage:image];
    [panoramaView setOrientToDevice:YES];
    [panoramaView setTouchToPan:YES];
    [panoramaView setPinchToZoom:YES];
    [panoramaView setShowTouches:NO];
    [panoramaView setVRMode:NO];
    [self setView:panoramaView];
    */
}

-(void) glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [panoramaView draw];
}

//图片缩放到指定大小尺寸
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

- (void)setTitlePanoramaView:(UIImage *)image{
    // 设置要展现的视图的大小
    panoramaView = [[PanoramaView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, (self.view.frame.size.height-49)/2)];
    // 设置全景图片
    [panoramaView setImage:image];
    // 是否开启陀螺仪
    [panoramaView setOrientToDevice:YES];
    // 手指拖拽
    [panoramaView setTouchToPan:YES];
    [panoramaView setPinchToZoom:YES];
    // 手指触控点经纬交叉点（十字交叉线）
    [panoramaView setShowTouches:NO];
    // 设置VR模式
    [panoramaView setVRMode:NO];
    // 替换根视图
    [self setView:panoramaView];

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
