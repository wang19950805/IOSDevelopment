//
//  ViewController.m
//  oc-jsDemo
//
//  Created by trustmobi on 2020/7/1.
//  Copyright © 2020 trustmobi. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

- (IBAction)testButton:(id)sender;
@property (strong, nonatomic)   WKWebView              *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
}


- (IBAction)testButton:(id)sender {
    WKWebView *webView = [[WKWebView alloc]init];
    
     NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"index.html" ofType:nil];
       NSString *localHtml = [NSString stringWithContentsOfFile:urlStr encoding:NSUTF8StringEncoding error:nil];
       NSURL *fileURL = [NSURL fileURLWithPath:urlStr];
       [self.webView loadHTMLString:localHtml baseURL:fileURL];      
       [self.view addSubview:self.webView];
    NSString *jsonData = @"没有数据";
    NSString *jsStr = [NSString stringWithFormat:@"readFileList(%@)",jsonData];
                                  
    [self.webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable result, NSError * _Nullable error) {
                    
                      NSLog(@"发送的json数据：%@",jsStr);
                      
                  }];
    
}
@end
