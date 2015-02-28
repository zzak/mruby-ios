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
#import "mruby/mruby/string.h"

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

static mrb_value
hello_mruby(mrb_state *mrb, const char *name){
    mrb_value say_hi_to = mrb_str_new_cstr(mrb, name);

    const char *hello_c = "Hello, ";

    mrb_value hello_mrb = mrb_str_new_cstr(mrb, hello_c);

    mrb_str_concat(mrb, hello_mrb, say_hi_to);
    return hello_mrb;
}

- (IBAction)sayHello {
    mrb_state *mrb = mrb_open();
    struct RClass *o;
    o = mrb->object_class;
    mrb_define_method(mrb, o, "hello", hello_mruby, MRB_ARGS_NONE());

    const char *name = [_textFieldHello.text UTF8String];
    mrb_value hi_ruby = hello_mruby(mrb, name);
    const char *hi_mruby = mrb_str_to_cstr(mrb, hi_ruby);
    
    NSString *say_hello = [NSString stringWithUTF8String:hi_mruby];

    UIAlertView *helloAlert = [[UIAlertView alloc]
                                    initWithTitle:@"" message:say_hello delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [helloAlert show];
}

- (IBAction)sayHello:(id)sender {
}
@end
