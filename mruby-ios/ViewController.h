//
//  ViewController.h
//  mruby-ios
//
//  Created by Zachary Scott on 2/27/15.
//  Copyright (c) 2015 Zachary Scott. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldHello;
- (IBAction)sayHello:(id)sender;

@end

