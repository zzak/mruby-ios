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
    char code[] = "p 'Hello, ";
    const char *helloname = [_textFieldHello.text UTF8String];
    strcat(code, helloname);
    strcat(code, "!'");
    
    mrb_load_string(mrb, code);
    UIAlertView *helloAlert = [[UIAlertView alloc]
                                    initWithTitle:@"" message:[_textFieldHello text] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //NSLog(@"_textFieldHello: %@", [_textFieldHello text]);
    [helloAlert show];
}

- (IBAction)sayHello:(id)sender {
}
@end
