//
//  ViewController.m
//  testProject
//
//  Created by 王益 on 15/3/17.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIProgressView *progressView;
@property (nonatomic, weak) IBOutlet UITextField *textField;

@property (nonatomic, weak) IBOutlet UILabel *floatLabel;

@property (nonatomic, assign) NSUInteger progress;

@property (nonatomic, weak) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld  context:nil];
    
//    self.floatLabel.text = @"就像 C 语言一样，Swift 使用变量来进行存储并通过变量名来关联值。在 Swift 中，值不可变的变量有着广泛的应用，它们就是常量，而且比 C 语言的常量更强大。在 Swift 中，如果你要处理的值不需要改变，那使用常量可以让你的代码更加安全并且更好地表达你的意图。";
    
    NSString *htmlStr = @"<a href=com.bhb.MicroPurchase://>点击打开云应用</a>";
    [_webView loadHTMLString:htmlStr baseURL:nil];
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"progress"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    _progressView.progress = _progress / 100.0;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textField resignFirstResponder];
    self.progress = [_textField.text integerValue];
    if (_progress > 100) {
        _progress = 100;
    }
}

@end
