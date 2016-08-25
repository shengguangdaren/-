//
//  footerView1.m
//  跑了个步
//
//  Created by qingyun on 16/8/24.
//  Copyright © 2016年 Mader. All rights reserved.
//

#import "footerView.h"
#import "xingzuo.h"
#import <Masonry.h>
@interface footerView()
@property(nonatomic,strong)UIScrollView *scrollerview;
@property(nonatomic,copy)NSMutableArray *arrBtn;
@property(nonatomic,copy)NSArray *arrTitle;
@property(nonatomic,copy)NSArray *arrImage;
@property(nonatomic,strong)UILabel *xingzuo;
@end
@implementation footerView
+(instancetype)init{
    footerView *footer=[footerView new];
    footer.userInteractionEnabled=YES;
    [footer loadScrollView];
    return footer;
}
-(NSArray *)arrImage{
    if (_arrImage==nil) {
        NSMutableArray *array=[NSMutableArray arrayWithCapacity:12];
        for (NSInteger i=0; i<12; i++) {
            NSString *str=[NSString stringWithFormat:@"%ld.png",i];
            UIImage *image=[UIImage imageNamed:str];
            [array addObject:image];
        }
        _arrImage = [array copy];
    }
    return _arrImage;
}
-(NSArray *)arrTitle{
    if (_arrTitle==nil) {
        _arrTitle=@[@"白羊",@"金牛",@"双子",@"巨蟹",@"狮子",@"处女",@"天秤",@"天蝎",@"射手",@"摩羯",@"水瓶",@"双鱼"];
    }
    return _arrTitle;
}
-(NSMutableArray *)arrBtn{
    if (_arrBtn==nil) {
        _arrBtn=[NSMutableArray array];
    }
    return _arrBtn;
}
-(void)loadScrollView{
    UIScrollView*scrollerView=[[UIScrollView alloc]init];
    scrollerView.backgroundColor=[UIColor clearColor];
    scrollerView.directionalLockEnabled=YES;
    scrollerView.showsHorizontalScrollIndicator=NO;
    self.scrollerview=scrollerView;
    [self addSubview:self.scrollerview];
    for (NSInteger index=0; index<12; index++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=index;
        NSString *str=self.arrTitle[index];
        UIImage *image=self.arrImage[index];
        image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        btn.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [btn setImage:image forState:UIControlStateNormal];
        [btn setTitle:str forState:UIControlStateNormal];
        [btn setTintColor:[UIColor whiteColor]];
//        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        btn.backgroundColor=[UIColor clearColor];
        [btn addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchDown];
        [self.scrollerview addSubview:btn];
        [self.arrBtn addObject:btn];
    }
    UILabel *label=[[UILabel alloc]init];
    label.numberOfLines=0;
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont systemFontOfSize:14];
    [self addSubview:label];
    self.xingzuo=label;

}
-(void)chooseBtn:(UIButton *)btn{
    for (UIButton *btn in self.scrollerview.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.enabled = YES;
//            btn.transform=CGAffineTransformIdentity;
//            btn.center=self.scrollerview.center;
        }
    }
    btn.transform=CGAffineTransformMakeScale(1.3, 1.3);
//    btn.transform=CGAffineTransformScale(btn.transform, 1.3, 1.3);
    btn.enabled = NO;
    [self.scrollerview scrollRectToVisible:btn.frame animated:YES];
    NSInteger num=btn.tag;
    NSString *strxingzu=[NSString stringWithFormat:@"%@座",self.arrTitle[num]];
    xingzuo *request=[xingzuo initWithNSString:strxingzu];
    [request setBlkXingzuo:^(NSDictionary *dict) {
        self.xingzuo.text=dict[@"summary"];
    }];
}
-(void)setStar:(NSString *)Star
{
    for (UIButton *btn in self.arrBtn) {
        if ([Star isEqualToString:btn.currentTitle]) {
            [self chooseBtn:btn];
        }
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof(self)weakself=self;
    CGFloat scroW=(self.window.bounds.size.width/3)*2;
    CGFloat scroX=self.window.bounds.size.width/6;
    self.scrollerview.contentSize=CGSizeMake(scroW*4, 1);
    self.scrollerview.frame=CGRectMake(scroX, 0, scroW, 70);
    for (NSInteger index=0; index<12; index++) {
        UIButton *btn=self.arrBtn[index];
        btn.frame=CGRectMake((index*scroW/3), 0, scroW/3-30, 70);
    }
    [self.xingzuo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.scrollerview.mas_bottom);
        make.leading.equalTo(weakself).offset(50);
        make.trailing.equalTo(weakself).offset(-50);
    }];
}
@end
