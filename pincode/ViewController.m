//
//  ViewController.m
//  pincode
//
//  Created by 李浩 on 16/7/20.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"
#import <ZBarReaderController.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *codeImageV;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)tapGesture:(UITapGestureRecognizer *)sender {
    //我的二维码 内容是 ”测试两个字“
    
    ZBarReaderController* read = [ZBarReaderController new];
    CGImageRef cgImageRef = ((UIImageView *)sender.view).image.CGImage;
    ZBarSymbol* symbol = nil;
    for(symbol in  [read scanImage:cgImageRef])
        break;
    if (symbol.data.length > 0) {
        self.resultLabel.text = symbol.data;
        self.resultLabel.backgroundColor = [UIColor redColor];
    }
//    _pincodeURL = symbol.data;
//    UIActionSheet *actionSheet;
//    if ([symbol.data hasPrefix:@"http"]) {
//        actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"保存图片" otherButtonTitles:@"扫二维码", nil];
//    } else {
//        actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"保存图片" otherButtonTitles:nil, nil];
//    }
//    [actionSheet showInView:self.superview];
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
