//
//  ViewController.m
//  mruby-ios
//
//  Created by Zachary Scott on 2/27/15.
//  Copyright (c) 2015 Zachary Scott. All rights reserved.
//

#import "ViewController.h"
#import "mruby/mruby.h"
#import "mruby/mruby/compile.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sayHello {
    mrb_state *mrb = mrb_open();
    char code[] = "p 'Hello, MRuby!'";
    
    mrb_load_string(mrb, code);
}

@end
