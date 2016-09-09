//
//  TestMasonryViewController.m
//  MySimpleEXDemo
//
//  Created by codyy on 16/8/31.
//  Copyright © 2016年 zpx. All rights reserved.
//

#import "TestMasonryViewController.h"

@interface TestMasonryViewController ()
@property (strong,nonatomic)CAShapeLayer *eyeFirstLightLayer;
@property (strong,nonatomic)CAShapeLayer *eyeSecondLightLayer;
@property (strong,nonatomic)CAShapeLayer *eyeballLayer;
@property (strong,nonatomic)CAShapeLayer *topEyesocketLayer;
@property (strong,nonatomic)CAShapeLayer *bottomEyesocketLayer;
@property (nonatomic,strong)dispatch_source_t timer;
@end
static CGSize size = {100,50};
@implementation TestMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self drawCircle];
//    [self test2];
//    [self test3];
}

//cashapeLayer 画图
-(void)drawCircle {
    CAShapeLayer *cicleLayer = [CAShapeLayer layer];
    cicleLayer.frame = CGRectMake(0, 0, 200, 200);
    cicleLayer.position = self.view.center;
    cicleLayer.fillColor = [UIColor yellowColor].CGColor;
    cicleLayer.lineWidth = 2.0;
    cicleLayer.strokeColor = [UIColor redColor].CGColor;
    CGRect frame = CGRectMake(0, 0, 200, 200);
    UIBezierPath *ciclePath = [UIBezierPath bezierPathWithOvalInRect:frame];
    cicleLayer.path = ciclePath.CGPath;
    [self.view.layer addSublayer:cicleLayer];
}
//居中
-(void)test1 {
    UIView *bgView = [[UIView alloc] init];
    [self.view addSubview:bgView];
    bgView.backgroundColor = [UIColor redColor];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bgView.superview).insets(UIEdgeInsetsMake(50, 50, 50, 50));
    }];
    
    UIView *infoView = [UIView new];
    infoView.backgroundColor = [UIColor yellowColor];
    [bgView addSubview:infoView];
    
    UILabel *name = [UILabel new];
    UILabel *info = [UILabel new];
    name.backgroundColor = [UIColor clearColor];
    info.backgroundColor = [UIColor clearColor];
    [infoView addSubview:name];
    [infoView addSubview:info];
    name.text = @"手机号码";
    info.text = @"15651118424";
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(infoView);
        make.top.equalTo(infoView);
        make.bottom.equalTo(infoView);
    }];
    [info mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(name);
        make.left.equalTo(name.mas_right).with.offset(20);
        make.right.equalTo(infoView.mas_right).with.offset(-10);
    }];
    [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView.mas_centerX);
        make.top.equalTo(infoView.superview).with.offset(100);
    }];
}
//等间隙
-(void)test2 {
    UIView *v11 = [UIView new];
    v11.backgroundColor = [UIColor redColor];
    UIView *v12 = [UIView new];
    v12.backgroundColor = [UIColor redColor];
    UIView *v13 = [UIView new];
    v13.backgroundColor = [UIColor redColor];
    UIView *v21 = [UIView new];
    v21.backgroundColor = [UIColor redColor];
    UIView *v31 = [UIView new];
    v31.backgroundColor = [UIColor redColor];
    [self.view addSubview:v11];
    [self.view addSubview:v12];
    [self.view addSubview:v13];
    [self.view addSubview:v21];
    [self.view addSubview:v31];
    
    UIView *p1 = [UIView new];
    [self.view addSubview:p1];
    UIView *p2 = [UIView new];
    [self.view addSubview:p2];
    UIView *p3 = [UIView new];
    [self.view addSubview:p3];
    UIView *p4 = [UIView new];
    [self.view addSubview:p4];
    UIView *p5 = [UIView new];
    [self.view addSubview:p5];
    UIView *p6 = [UIView new];
    [self.view addSubview:p6];
    
    [p1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.centerY.equalTo(v11);
        make.right.equalTo(v11.mas_left);
        make.height.equalTo(@100);
        make.width.equalTo(@100);
    }];
    [p2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(p1);
        make.height.equalTo(p1);
        make.centerY.equalTo(v11);
        make.left.equalTo(v11.mas_right);
        make.right.equalTo(v12.mas_left);
    }];
    [p3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(v11);
        make.width.equalTo(p1);
        make.height.equalTo(p1);
        make.left.equalTo(v12.mas_right);
        make.right.equalTo(v13.mas_left);
    }];
    [p4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(v11);
        make.width.equalTo(p1);
        make.height.equalTo(p1);
        make.left.equalTo(v13.mas_right);
        make.right.equalTo(self.view.mas_right);
    }];
    [p5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(p1);
        make.width.equalTo(p1);
        make.height.equalTo(p1);
        make.top.equalTo(v11.mas_bottom);
        make.bottom.equalTo(v21.mas_top);
    }];
    [p6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(p1);
        make.width.equalTo(p1);
        make.height.equalTo(p1);
        make.top.equalTo(v21.mas_bottom);
        make.bottom.equalTo(v31.mas_top);
    }];
    
    [v11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(20);
    }];
    [v12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(v11.mas_width);
        make.height.equalTo(v11.mas_height);
        make.centerY.equalTo(v11);
    }];
    [v13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(v11.mas_width);
        make.height.equalTo(v11.mas_height);
        make.centerY.equalTo(v11);
    }];
    [v21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(v11.mas_width);
        make.height.equalTo(v11.mas_height);
        make.centerX.equalTo(v11);
    }];
    [v31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).with.offset(-20);
        make.width.equalTo(v11.mas_width);
        make.height.equalTo(v11.mas_height);
        make.centerX.equalTo(v11);
    }];
}
//画了一个眼睛^_^
-(void)test3 {
//    self.eyeFirstLightLayer.frame = CGRectMake(0, 0, 100, 50);
    self.eyeFirstLightLayer.position = self.view.center;
    self.eyeballLayer.position = self.view.center;
    self.eyeSecondLightLayer.position = self.view.center;
    self.topEyesocketLayer.position = self.view.center;
    self.bottomEyesocketLayer.position = self.view.center;
    
    [self.view.layer addSublayer:self.eyeFirstLightLayer];
    [self.view.layer addSublayer:self.eyeSecondLightLayer];
    [self.view.layer addSublayer:self.eyeballLayer];
    [self.view.layer addSublayer:self.topEyesocketLayer];
    [self.view.layer addSublayer:self.bottomEyesocketLayer];
}


-(CAShapeLayer *)eyeFirstLightLayer {
    if (!_eyeFirstLightLayer) {
        _eyeFirstLightLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(size.width/2, size.height/2);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:size.width*0.2
                                                        startAngle:(230.f/180.f)*M_PI
                                                          endAngle:(265.f/180.f)*M_PI
                                                         clockwise:YES];
        _eyeFirstLightLayer.borderColor = [UIColor blackColor].CGColor;
        _eyeFirstLightLayer.lineWidth = 5.0;
        _eyeFirstLightLayer.path = path.CGPath;
        _eyeFirstLightLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeFirstLightLayer.strokeColor = [UIColor whiteColor].CGColor;
    }
    return _eyeFirstLightLayer;
}

-(CAShapeLayer *)eyeSecondLightLayer {
    if (!_eyeSecondLightLayer) {
        _eyeSecondLightLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(size.width/2, size.height/2);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:size.width*0.2
                                                        startAngle:(211.f/180.f)*M_PI
                                                          endAngle:(220.f/180.f)*M_PI
                                                         clockwise:YES];
        _eyeSecondLightLayer.borderColor = [UIColor blackColor].CGColor;
        _eyeSecondLightLayer.lineWidth = 5.0;
        _eyeSecondLightLayer.path = path.CGPath;
        _eyeSecondLightLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeSecondLightLayer.strokeColor = [UIColor whiteColor].CGColor;
    }
    return _eyeSecondLightLayer;
}


-(CAShapeLayer *)eyeballLayer {
    if (!_eyeballLayer) {
        _eyeballLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(size.width/2, size.height/2);
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                            radius:size.width*0.3
                                                        startAngle:(0.f/180.f)*M_PI
                                                          endAngle:(360.f/180.f)*M_PI
                                                         clockwise:YES];
        _eyeballLayer.borderColor = [UIColor blackColor].CGColor;
        _eyeballLayer.lineWidth = 1.f;
        _eyeballLayer.path = path.CGPath;
        _eyeballLayer.fillColor = [UIColor clearColor].CGColor;
        _eyeballLayer.strokeColor = [UIColor whiteColor].CGColor;
        _eyeballLayer.anchorPoint = CGPointMake(0.5, 0.5);
    }
    return _eyeballLayer;
}

-(CAShapeLayer *)topEyesocketLayer {
    if (!_topEyesocketLayer) {
        _topEyesocketLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(size.width/2, size.height/2);
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, size.height/2)];
        [path addQuadCurveToPoint:CGPointMake(size.width, size.height/2) controlPoint:CGPointMake(size.width/2, center.y-center.y-20)];
        _topEyesocketLayer.borderColor = [UIColor blackColor].CGColor;
        _topEyesocketLayer.lineWidth = 1.f;
        _topEyesocketLayer.path = path.CGPath;
        _topEyesocketLayer.fillColor = [UIColor clearColor].CGColor;
        _topEyesocketLayer.strokeColor = [UIColor whiteColor].CGColor;
    }
    return _topEyesocketLayer;
}

-(CAShapeLayer *)bottomEyesocketLayer {
    if (!_bottomEyesocketLayer) {
        _bottomEyesocketLayer = [CAShapeLayer layer];
        CGPoint center = CGPointMake(size.width/2, size.height/2);
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, size.height/2)];
        [path addQuadCurveToPoint:CGPointMake(size.width, size.height/2) controlPoint:CGPointMake(size.width/2, center.y+center.y+20)];
        _bottomEyesocketLayer.borderColor = [UIColor blackColor].CGColor;
        _bottomEyesocketLayer.lineWidth = 1.f;
        _bottomEyesocketLayer.path = path.CGPath;
        _bottomEyesocketLayer.fillColor = [UIColor clearColor].CGColor;
        _bottomEyesocketLayer.strokeColor = [UIColor whiteColor].CGColor;
    }
    return _bottomEyesocketLayer;
}
@end
